import 'package:apppalma/constants.dart';
import 'package:apppalma/moor/daos/erradicaciones_dao.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/toasts/toasts.dart';
import '../../../main.dart';
import '../../../moor/daos/palma_daos.dart';
import '../../../moor/moor_database.dart';
import '../../../moor/tables/palmas_table.dart';
part 'erradicacion_state.dart';

class ErradicacionCubit extends Cubit<ErradicacionState> {
  ErradicacionCubit() : super(ErradicacionInitial());

  final db = getIt<AppDatabase>();

  resetState() {
    emit(ErradicacionInitial());
  }

  causaChanged(String value) {
    emit(state.copyWith(causa: value));
  }

  erradicarPalma() async {
    try {
      emit(state.copyWith(status: FormStatus.submissionInProgress));
      TimeOfDay horaRegistro = TimeOfDay.now();
      DateTime fechaRegistro = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          horaRegistro.hour,
          horaRegistro.minute);
      final PalmaDao palmaDao = db.palmaDao;
      final ErradicacionesDao erradicacionesDao = db.erradicacionesDao;

      if (state.tieneCausa!) {
        actualizarPalmaErradicada(
            state.palma!.enfermedad!.procedimientoEnfermedad,
            state.palma!.palma,
            fechaRegistro);
      } else {
        if (state.palma != null) {
          actualizarPalmaErradicada(
              state.causa!, state.palma!.palma, fechaRegistro);
          successMessageToast('Se realizó el registro exitosamente');
          emit(ErradicacionInitial());
        } else {
          final palmaNueva = PalmasCompanion(
            identificador: Value(state.numeroPalma!.toString() +
                state.lineaPalma!.toString() +
                state.nombreLote!),
            numeroenlinea: Value(state.numeroPalma!),
            numerolinea: Value(state.lineaPalma!),
            nombreLote: Value(state.nombreLote!),
            estadopalma: const Value(EstadosPalma.erradicada),
          );
          final id = await palmaDao.insertPalma(palmaNueva);
          final e = ErradicacionCompanion(
            causaErradicacion: Value(state.causa),
            fechaRegistro: Value(fechaRegistro),
            idPalma: Value(id),
          );
          await erradicacionesDao.insertErradicacion(e);
        }
      }
      successMessageToast('Se realizó el registro exitosamente');
      emit(ErradicacionInitial());
    } catch (e) {
      emit(state.copyWith(status: FormStatus.submissionFailure));
    }
  }

  actualizarPalmaErradicada(String causa, Palma palma, DateTime fechaRegistro) {
    final ErradicacionesDao erradicacionesDao = db.erradicacionesDao;
    final PalmaDao palmaDao = db.palmaDao;
    final e = ErradicacionCompanion(
      causaErradicacion: Value(causa),
      fechaRegistro: Value(fechaRegistro),
    );
    erradicacionesDao.insertErradicacion(e);
    palmaDao.updatePalma(state.palma!.palma
        .copyWith(estadopalma: EstadosPalma.erradicada, sincronizado: false));
  }

  validarPalma(String nombrelote, int numerolinea, int numeropalma) async {
    emit(ValidandoPalma());
    await Future.delayed(const Duration(seconds: 1));
    final PalmaDao palmaDao = db.palmaDao;
    final palma = await palmaDao.obtenerPalmaConRegistros(
        nombrelote, numerolinea, numeropalma);
    if (palma != null) {
      if (palma.palma.estadopalma == EstadosPalma.pendientePorErradicar) {
        emit(ErradicacionInfoState(
            palma: palma,
            lineaPalma: numerolinea,
            nombreLote: nombrelote,
            tieneCausa: true,
            numeroPalma: numeropalma));
      } else {
        emit(ErradicacionInfoState(
            palma: palma,
            tieneCausa: false,
            lineaPalma: numerolinea,
            nombreLote: nombrelote,
            numeroPalma: numeropalma));
      }
    } else {
      emit(ErradicacionInfoState(
          lineaPalma: numerolinea,
          nombreLote: nombrelote,
          numeroPalma: numeropalma,
          tieneCausa: false));
    }
  }
}

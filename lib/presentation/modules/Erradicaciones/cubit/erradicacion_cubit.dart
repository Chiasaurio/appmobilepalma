import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apppalma/globals.dart' as globals;

import '../../../../data/moor/daos/daos.dart';
import '../../../../data/moor/tables/tables.dart';

part 'erradicacion_state.dart';

class ErradicacionCubit extends Cubit<ErradicacionConCausa> {
  ErradicacionCubit() : super(const ErradicacionConCausa());
  final db = getIt<AppDatabase>();

  initErradicacion(PalmaConEnfermedad palma) {
    emit(ErradicacionConCausa(
      palma: palma,
      nombreLote: palma.palma.nombreLote,
    ));
  }

  observacionesChanged(String observaciones) {
    emit(state.copyWith(observaciones: observaciones));
  }

  Future<void> erradicarPalma() async {
    try {
      emit(state.copyWith(status: FormStatus.submissionInProgress));
      TimeOfDay horaRegistro = TimeOfDay.now();
      DateTime fechaRegistro = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          horaRegistro.hour,
          horaRegistro.minute);
      final causa = state.palma!.registroEnfermedad.nombreEnfermedad;
      await actualizarPalmaErradicada(
          causa, state.palma!.palma, fechaRegistro, state.observaciones);
      emit(state.copyWith(status: FormStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.submissionFailure));
    }
  }

  actualizarPalmaErradicada(
      [String? causa,
      Palma? palma,
      DateTime? fechaRegistro,
      String? observaciones]) async {
    final ErradicacionesDao erradicacionesDao = db.erradicacionesDao;
    final PalmaDao palmaDao = db.palmaDao;
    final e = ErradicacionCompanion(
      observaciones: Value(observaciones),
      causaErradicacion: Value(causa),
      fechaRegistro: Value(fechaRegistro!),
      responsable: Value(globals.responsable),
      idPalma: Value(palma!.identificador),
    );
    await erradicacionesDao.insertErradicacion(e);
    await palmaDao.updatePalma(palma.copyWith(
        estadopalma: EstadosPalma.erradicada, sincronizado: false));
  }
}

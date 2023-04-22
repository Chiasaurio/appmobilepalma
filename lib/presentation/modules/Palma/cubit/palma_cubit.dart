import 'package:apppalma/domain/palma/models/palma_con_procesos_model.dart';
import 'package:apppalma/presentation/components/toasts/toasts.dart';
import 'package:apppalma/data/moor/daos/daos.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:apppalma/utils/get_palma_identificador.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import 'package:apppalma/globals.dart' as globals;

part 'palma_state.dart';

class PalmaCubit extends Cubit<PalmaState> {
  final db = getIt<AppDatabase>();
  PalmaCubit() : super(const PalmaInitial());

  obtenerPalmasLote(String nombrelote) async {
    final PalmaDao palmaDao = db.palmaDao;
    final palmas = await palmaDao.obtenerPalmas(nombrelote);
    emit(state.copyWith(palmas: palmas));
  }

  palmaSeleccionadaChanged(Palma palma) {
    emit(state.copyWith(
        lineaPalma: palma.numerolinea, numeroPalma: palma.numeroenlinea));
  }

  orientacionChanged(String value) {
    emit(state.copyWith(observaciones: value, orientacion: value));
  }

  Future<void> obtenerProcesosPalma(
      {int? numeroLinea, int? numeroPalma}) async {
    emit(state.copyWith(status: FormStatus.submissionInProgress));
    final PalmaDao palmaDao = db.palmaDao;
    final EnfermedadesDao enfermedadDao = db.enfermedadesDao;
    final palma = await palmaDao.obtenerPalma(state.nombreLote!,
        numeroLinea ?? state.lineaPalma!, numeroPalma ?? state.numeroPalma!);
    if (palma != null) {
      final List<RegistroEnfermedadData> registroenfermedad =
          await palmaDao.obtenerRegistroEnfermedad(palma);
      List<RegistroEnfermedadDatos> registroenfermedaddatos = [];
      for (var r in registroenfermedad) {
        Enfermedade? enfermedad;
        Etapa? etapa;
        RegistroTratamientoData? registrotratamiento;
        enfermedad = await enfermedadDao.obtenerEnfermedad(r.nombreEnfermedad);
        if (r.idEtapaEnfermedad != null) {
          etapa = await enfermedadDao.obtenerEtapa(r.idEtapaEnfermedad!);
        }
        registrotratamiento = await palmaDao.obtenerTratamiento(r);
        final registroConDatos = RegistroEnfermedadDatos(
            registroenfermedad: r,
            etapa: etapa,
            enfermedad: enfermedad,
            registrotratamiento: registrotratamiento);
        registroenfermedaddatos.add(registroConDatos);
      }
      PalmaConProcesos palmaconprocesos = PalmaConProcesos(
          palma: palma, registroenfermedaddatos: registroenfermedaddatos);
      emit(state.copyWith(
          status: FormStatus.submissionSuccess,
          palmaSeleccionada: palmaconprocesos));
    }
    emit(state.copyWith(
      status: FormStatus.submissionSuccess,
    ));
  }

  Future<void> lineaDePalmaChanged(int? lineaPalma) async {
    emit(state.copyWith(lineaPalma: lineaPalma));
  }

  Future<void> numeroDePalmaChanged(int? numeroPalma) async {
    emit(state.copyWith(numeroPalma: numeroPalma));
  }

  Future<void> causaChanged(String? causa) async {
    emit(state.copyWith(causa: causa));
  }

  Future<void> initState(String nombreLote) async {
    emit(PalmaInitial(nombreLote: nombreLote));
  }

  Future<void> resetState() async {
    emit(PalmaInitial(nombreLote: state.nombreLote, palmas: state.palmas));
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

      // if (state.tieneCausa!) {
      if (state is ErradicacionConCausa) {
        final causa = state.palmaSeleccionada!.registroenfermedaddatos
            .firstWhere((element) {
              return element.enfermedad!.procedimientoEnfermedad ==
                  ProcedimientosEnfermedad.erradicacion;
            })
            .enfermedad!
            .nombreEnfermedad;
        await actualizarPalmaErradicada(
            causa, state.palmaSeleccionada!.palma, fechaRegistro, state.causa);
      } else {
        if (state.palmaSeleccionada != null) {
          await actualizarPalmaErradicada(
              state.causa!, state.palmaSeleccionada!.palma, fechaRegistro);
          successMessageToast('Se realizó el registro exitosamente');
          emit(PalmaInitial(nombreLote: state.nombreLote));
        } else {
          final identificador = generateIdentifier(
              state.numeroPalma!, state.lineaPalma!, state.nombreLote!);
          final palmaNueva = PalmasCompanion(
            identificador: Value(identificador),
            orientacion: Value(state.orientacion!),
            numeroenlinea: Value(state.numeroPalma!),
            numerolinea: Value(state.lineaPalma!),
            nombreLote: Value(state.nombreLote!),
            estadopalma: const Value(EstadosPalma.erradicada),
          );
          await palmaDao.insertPalma(palmaNueva);
          // final idPalma = state.numeroPalma!.toString() +
          //     state.lineaPalma!.toString() +
          //     state.nombreLote!;
          final e = ErradicacionCompanion(
            responsable: Value(globals.responsable),
            causaErradicacion: const Value("state.causa"),
            fechaRegistro: Value(fechaRegistro),
            idPalma: Value(identificador),
          );
          await erradicacionesDao.insertErradicacion(e);
        }
      }
      emit(state.copyWith(
        status: FormStatus.submissionSuccess,
      ));
      successMessageToast('Se realizó el registro exitosamente');
      // emit(PalmaState(nombreLote: state.nombreLote, palmas: state.palmas));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.submissionFailure));
    }
  }

  initErradicacion() {
    if (state.palmaSeleccionada != null &&
        state.palmaSeleccionada!.palma.estadopalma ==
            EstadosPalma.pendientePorErradicar) {
      emit(ErradicacionConCausa(
        palmaSeleccionada: state.palmaSeleccionada,
        nombreLote: state.palmaSeleccionada!.palma.nombreLote,
      ));
    } else {
      emit(ErradicacionSinCausa(
        lineaPalma: state.lineaPalma,
        numeroPalma: state.numeroPalma,
        palmaSeleccionada: state.palmaSeleccionada,
        nombreLote: state.nombreLote,
      ));
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
      // idPalma: Value(palma!.numeroenlinea.toString() +
      //     palma.numerolinea.toString() +
      //     palma.nombreLote)
      idPalma: Value(palma!.identificador),
    );
    await erradicacionesDao.insertErradicacion(e);
    await palmaDao.updatePalma(palma.copyWith(
        estadopalma: EstadosPalma.erradicada, sincronizado: false));
  }
}

class PalmaArguments {
  final String nombrelote;
  final int numerolinea;
  final int numeroenlinea;

  PalmaArguments(this.nombrelote, this.numerolinea, this.numeroenlinea);
}

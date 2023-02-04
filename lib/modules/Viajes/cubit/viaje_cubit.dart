import 'package:apppalma/components/toasts/toasts.dart';
import 'package:apppalma/moor/daos/viajes_dao.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apppalma/moor/daos/cosecha_daos.dart';

import '../../../main.dart';
import '../../../utils/form_status.dart';

part 'viaje_state.dart';

class ViajeCubit extends Cubit<ViajeInitial> {
  ViajeCubit() : super(const ViajeInitial(cosechasDelViaje: [], totalKilos: 0));
  final db = getIt<AppDatabase>();

  void initViajesState() {
    emit(const ViajeInitial(cosechasDelViaje: [], totalKilos: 0));
  }

  void agregarCosechaAlViaje(Cosecha cosecha) {
    num kilosAhora = state.totalKilos;
    num nuevosKilos = kilosAhora + cosecha.kilos;
    num racimosAhora = state.totalRacimos;
    num nuevosRacimos = racimosAhora + cosecha.cantidadRacimos;
    List<Cosecha> cosechasNuevas = List.from(state.cosechasDelViaje);
    cosechasNuevas.add(cosecha);
    emit(state.copyWith(
        cosechasDelViaje: cosechasNuevas,
        totalRacimos: nuevosRacimos,
        totalKilos: nuevosKilos));
  }

  void eliminarCosechaDelViaje(Cosecha cosecha) {
    num kilosAhora = state.totalKilos;
    num nuevosKilos = kilosAhora - cosecha.kilos;
    num racimosAhora = state.totalRacimos;
    num nuevosRacimos = racimosAhora - cosecha.cantidadRacimos;

    List<Cosecha> cosechasNuevas = state.cosechasDelViaje;
    cosechasNuevas.removeWhere(
      (element) {
        return element.id == cosecha.id;
      },
    );
    emit(state.copyWith(
        cosechasDelViaje: cosechasNuevas,
        totalKilos: nuevosKilos,
        totalRacimos: nuevosRacimos));
  }

  void setHoraCarga(TimeOfDay hora) {
    emit(state.copyWith(horaCarga: hora));
  }

  void setHoraSalida(TimeOfDay hora) {
    emit(state.copyWith(horaSalida: hora));
  }

  Future<void> finalizarViaje() async {
    try {
      emit(state.copyWith(status: FormStatus.noSubmitted));
      final ViajesDao viajeDao = db.viajesDao;
      final fechaViaje = DateTime.now();
      final horaCargaToDateTime = DateTime(fechaViaje.year, fechaViaje.month,
          fechaViaje.day, state.horaCarga!.hour, state.horaCarga!.minute);
      final horaSalidaToDateTime = DateTime(fechaViaje.year, fechaViaje.month,
          fechaViaje.day, state.horaSalida!.hour, state.horaSalida!.minute);
      final ViajesCompanion viaje = ViajesCompanion(
        cantidadRacimos: Value(state.totalRacimos.toInt()),
        kilos: Value(state.totalRacimos.toInt()),
        completado: const Value(false),
        horaCargue: Value(horaCargaToDateTime),
        horaSalida: Value(horaSalidaToDateTime),
      );
      int idViaje = await viajeDao.insertViaje(viaje);
      //actualizar estado de cosecha
      final CosechaDao cosechaDao = db.cosechaDao;
      for (var c in state.cosechasDelViaje) {
        cosechaDao.updateCosecha(
            c.copyWith(idViaje: Value(idViaje), sincronizado: false));
      }
      successMessageToast('Viaje enviado con éxito');
      emit(state.copyWith(status: FormStatus.submissionSuccess));
    } catch (e) {
      registroFallidoToast('$e');
      emit(state.copyWith(status: FormStatus.submissionFailure));
    }
  }
}

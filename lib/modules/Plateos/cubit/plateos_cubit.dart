import 'package:apppalma/moor/daos/plateos_dao.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';

part 'plateos_state.dart';

class PlateosCubit extends Cubit<PlateosStateLoaded> {
  PlateosCubit() : super(const PlateosStateLoaded());

  final db = getIt<AppDatabase>();

  obtenerPlateoActivo(String nombrelote) async {
    emit(const PlateosStateLoaded(isLoaded: false));
    final PlateoDao plateoDao = db.plateoDao;
    final Plateo? plateo = await plateoDao.getPlateoActivo(nombrelote);
    List<PlateoDiarioData> plateosDiarios = [];
    if (plateo != null) {
      plateosDiarios = await obtenerPlateosDiarios(plateo.id);
    }
    emit(PlateosStateLoaded(
        plateo: plateo, plateosDiarios: plateosDiarios, isLoaded: true));
  }

  comenzarNuevoPlateo(String nombrelote, DateTime fecha) async {
    final PlateoDao plateoDao = db.plateoDao;
    final plateo = PlateosCompanion(
      nombreLote: Value(nombrelote),
      cantidadPlateada: const Value(0),
      fechaIngreso: Value(fecha),
    );
    await plateoDao.insertPlateo(plateo);
    obtenerPlateoActivo(nombrelote);
  }

  obtenerPlateosDiarios(int idPlateo) async {
    final PlateoDao plateoDao = db.plateoDao;
    final List<PlateoDiarioData> plateosdiarios =
        await plateoDao.getPlateosDiarios(idPlateo);
    return plateosdiarios;
  }

  insertarPlateoDiario(
      DateTime fecha, int cantidad, String tipo, Plateo plateo) async {
    final nuevosPlateos = plateo.cantidadPlateada + cantidad;
    final PlateoDao plateoDao = db.plateoDao;
    final plateoDiarioCompanion = PlateoDiarioCompanion(
      cantidadPlateada: Value(cantidad),
      fecha: Value(fecha),
      tipoPlateo: Value(tipo),
      idPlateo: Value(plateo.id),
    );
    await plateoDao.insertPlateoDiario(plateoDiarioCompanion);
    plateoDao.updatePlateo(plateo.copyWith(cantidadPlateada: nuevosPlateos));
    obtenerPlateoActivo(plateo.nombreLote);
  }

  finalizarPlateo(Plateo plateo, DateTime fechasalida) {
    final PlateoDao plateoDao = db.plateoDao;
    plateoDao.updatePlateo(
        plateo.copyWith(fechaSalida: Value(fechasalida), completado: true));
    obtenerPlateoActivo(plateo.nombreLote);
    // successMessageToast('El plateo se finalizo correctamente');
  }
}

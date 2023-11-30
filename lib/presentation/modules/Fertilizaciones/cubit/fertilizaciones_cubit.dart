import 'package:apppalma/data/moor/daos/daos.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apppalma/globals.dart' as globals;

import '../../../components/toasts/toasts.dart';

part 'fertilizaciones_state.dart';

class FertilizacionCubit extends Cubit<FertilizacionStateLoaded> {
  FertilizacionCubit() : super(const FertilizacionStateLoaded());

  final db = getIt<AppDatabase>();

  obtenerFertilizacionActiva(String nombrelote) async {
    emit(const FertilizacionStateLoaded(isLoaded: false));
    final FertilizacionDao plateoDao = db.fertilizacionDao;
    final Fertilizacione? fertilizacion =
        await plateoDao.getFertilizacionActiva(nombrelote);
    List<FertilizacionDiariaData> fertilizacionDarias = [];
    if (fertilizacion != null) {
      fertilizacionDarias =
          await obtenerFertilizacionesDiarias(fertilizacion.id);
    }
    emit(FertilizacionStateLoaded(
        fertilizacion: fertilizacion,
        fertilizacionDarias: fertilizacionDarias,
        isLoaded: true));
  }

  comenzarNuevaFertilizacion(String nombrelote, DateTime fecha) async {
    final FertilizacionDao fertilizacionDao = db.fertilizacionDao;
    final plateo = FertilizacionesCompanion(
      nombreLote: Value(nombrelote),
      cantidadFertilizada: const Value(0),
      fechaIngreso: Value(fecha),
    );
    await fertilizacionDao.insertFertilizacion(plateo);
    obtenerFertilizacionActiva(nombrelote);
  }

  obtenerFertilizacionesDiarias(int idFertilizacion) async {
    final FertilizacionDao fertilizacionDao = db.fertilizacionDao;
    final List<FertilizacionDiariaData> fertilizacionesDarias =
        await fertilizacionDao.getFertilizacionesDiarias(idFertilizacion);
    return fertilizacionesDarias;
  }

  cargarFertilizantes() async {
    final FertilizanteDao fertilizanteDao = db.fertilizanteDao;
    final List<FertilizanteData> fertilizantes =
        await fertilizanteDao.getFertilizantes();
    emit(state.copyWith(fertilizantes: fertilizantes));
  }

  insertarFertilizacionDiaria(
      DateTime fecha,
      int cantidad,
      String nombreFertilizante,
      double dosis,
      String unidades,
      Fertilizacione fertilizacion,
      String lineaInicio,
      String numeroPalmaInicio,
      String orientacionInicio,
      String lineaFin,
      String numeroPalmaFin,
      String orientacionFin) async {
    final nuevosFertilizacion = fertilizacion.cantidadFertilizada + cantidad;
    final FertilizacionDao fertilizacionDao = db.fertilizacionDao;
    final fertilizacionDiariaCompanion = FertilizacionDiariaCompanion(
        idFertilizacion: Value(fertilizacion.id),
        cantidadFertilizada: Value(cantidad),
        fecha: Value(fecha),
        nombreFertilizante: Value(nombreFertilizante),
        dosis: Value(dosis),
        unidades: Value(unidades),
        lineaInicio: Value(lineaInicio),
        numeroInicio: Value(numeroPalmaInicio),
        orientacionInicio: Value(orientacionInicio),
        lineaFin: Value(lineaFin),
        numeroFin: Value(numeroPalmaFin),
        orientacionFin: Value(orientacionFin),
        responsable: Value(globals.responsable));
    await fertilizacionDao
        .insertFertilizacionDiaria(fertilizacionDiariaCompanion);
    fertilizacionDao.updateFertilizacion(fertilizacion.copyWith(
        cantidadFertilizada: nuevosFertilizacion, sincronizado: false));
    obtenerFertilizacionActiva(fertilizacion.nombreLote);
  }

  finalizarFertilizacion(Fertilizacione fertilizacion, DateTime fechasalida) {
    final FertilizacionDao fertilizacionDao = db.fertilizacionDao;
    fertilizacionDao.updateFertilizacion(fertilizacion.copyWith(
        fechaSalida: Value(fechasalida),
        completado: true,
        sincronizado: false));
    obtenerFertilizacionActiva(fertilizacion.nombreLote);
  }
}

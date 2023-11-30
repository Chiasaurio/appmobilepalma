import 'package:apppalma/data/moor/daos/daos.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apppalma/globals.dart' as globals;

part 'podas_state.dart';

class PodasCubit extends Cubit<PodasStateLoaded> {
  PodasCubit() : super(const PodasStateLoaded());

  final db = getIt<AppDatabase>();

  obtenerPodaActiva(String nombrelote) async {
    emit(const PodasStateLoaded(isLoaded: false));
    final PodaDao podaDao = db.podaDao;
    final Poda? poda = await podaDao.getPodaActiva(nombrelote);
    List<PodaDiariaData> podasDiarias = [];
    if (poda != null) {
      podasDiarias = await obtenerPodasDiarias(poda.id);
    }
    emit(PodasStateLoaded(
        poda: poda, podasDiarias: podasDiarias, isLoaded: true));
  }

  insertarPodaDiaria(
      DateTime fecha,
      int cantidad,
      Poda poda,
      String lineaInicio,
      String numeroPalmaInicio,
      String orientacionInicio,
      String lineaFin,
      String numeroPalmaFin,
      String orientacionFin) async {
    final nuevasPodas = poda.cantidadPodada + cantidad;
    final PodaDao podaDao = db.podaDao;
    final podaDiariaCompanion = PodaDiariaCompanion(
        cantidadPodada: Value(cantidad),
        fechaIngreso: Value(fecha),
        idPoda: Value(poda.id),
        lineaInicio: Value(lineaInicio),
        numeroInicio: Value(numeroPalmaInicio),
        orientacionInicio: Value(orientacionInicio),
        lineaFin: Value(lineaFin),
        numeroFin: Value(numeroPalmaFin),
        orientacionFin: Value(orientacionFin),
        responsable: Value(globals.responsable));
    await podaDao.insertPodaDiaria(podaDiariaCompanion);
    podaDao.updatePoda(
        poda.copyWith(cantidadPodada: nuevasPodas, sincronizado: false));
    obtenerPodaActiva(poda.nombreLote);
  }

  obtenerPodasDiarias(int idPoda) async {
    final PodaDao podaDao = db.podaDao;
    final List<PodaDiariaData> podasdiarias =
        await podaDao.getPodasDiarias(idPoda);
    return podasdiarias;
  }

  comenzarNuevaPoda(String nombrelote, DateTime fecha) async {
    final PodaDao podaDao = db.podaDao;
    final poda = PodasCompanion(
      nombreLote: Value(nombrelote),
      cantidadPodada: const Value(0),
      fechaIngreso: Value(fecha),
    );
    await podaDao.insertPoda(poda);
    obtenerPodaActiva(nombrelote);
  }

  finalizarPoda(Poda poda, DateTime fechasalida) {
    final PodaDao podaDao = db.podaDao;
    podaDao.updatePoda(poda.copyWith(
        fechaSalida: Value(fechasalida),
        completada: true,
        sincronizado: false));
    obtenerPodaActiva(poda.nombreLote);
    // successMessageToast('La poda se finalizo correctamente');
  }
}

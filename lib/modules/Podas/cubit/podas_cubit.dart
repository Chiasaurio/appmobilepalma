import 'package:apppalma/components/toasts/toasts.dart';
import 'package:apppalma/moor/daos/podas_dao.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';

import '../../../main.dart';

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

  insertarPodaDiaria(DateTime fecha, int cantidad, Poda poda) async {
    final nuevasPodas = poda.cantidadPodada + cantidad;
    final PodaDao podaDao = db.podaDao;
    final podaDiariaCompanion = PodaDiariaCompanion(
      cantidadPodada: Value(cantidad),
      fechaIngreso: Value(fecha),
      idPoda: Value(poda.id),
    );
    await podaDao.insertPodaDiaria(podaDiariaCompanion);
    podaDao.updatePoda(poda.copyWith(cantidadPodada: nuevasPodas));
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
    final PodaDao cosechaDao = db.podaDao;
    cosechaDao
        .updatePoda(poda.copyWith(fechaSalida: fechasalida, completada: true));
    obtenerPodaActiva(poda.nombreLote);
    // successMessageToast('La poda se finalizo correctamente');
  }
}

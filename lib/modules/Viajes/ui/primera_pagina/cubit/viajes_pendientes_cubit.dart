import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../main.dart';
import '../../../../../moor/daos/viajes_dao.dart';
import '../../../../../moor/moor_database.dart';

part 'viajes_pendientes_state.dart';

class ViajesPendientesCubit extends Cubit<ViajesPendientesState> {
  ViajesPendientesCubit() : super(const ViajesPendientesState());
  final db = getIt<AppDatabase>();

  Future<void> getViajesPendientes() async {
    final ViajesDao viajeDao = db.viajesDao;
    List<Viaje> res = await viajeDao.getViajes();
    res.removeWhere((element) => element.kilosExtractora != null);
    emit(ViajesPendientesState(viajesPendientes: res));
  }
}

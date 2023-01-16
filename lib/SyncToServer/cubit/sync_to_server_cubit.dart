import 'package:apppalma/moor/daos/cosecha_daos.dart';
import 'package:apppalma/moor/daos/plateos_dao.dart';
import 'package:apppalma/moor/daos/podas_dao.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/plateos_table.dart';
import 'package:apppalma/moor/tables/podas_table.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../../moor/tables/cosechas_table.dart';

part 'sync_to_server_state.dart';

class SyncToServerCubit extends Cubit<SyncToServerState> {
  SyncToServerCubit() : super(const SyncToServerState());
  final db = getIt<AppDatabase>();

  void getRegistrosPendientes() async {
    emit(const SyncToServerState());
    final cosechasPendientes = await getCosechasPendientesSincronizar();
    final podasPendientes = await getPodasPendientesSincronizar();
    final plateosPendientes = await getPlateosPendientesSincronizar();
    emit(state.copyWith(
        cosechasConDiariasPendientes: cosechasPendientes,
        podasConDiariasPendientes: podasPendientes,
        plateosConDiariasPendientes: plateosPendientes,
        loaded: true));
  }

  Future<List<CosechaConCosechasDiarias>>
      getCosechasPendientesSincronizar() async {
    try {
      final CosechaDao cosechaDao = db.cosechaDao;
      final CosechaDiariaDao cosechaDiariaDao = db.cosechaDiariaDao;
      List<CosechaConCosechasDiarias> cosechasConDiarias = [];
      final cosechas = await cosechaDao.getCosechasForSync();
      for (var c in cosechas) {
        final cosechasDiarias =
            await cosechaDiariaDao.getCosechasDiariasForSync(c!.id);
        cosechasConDiarias.add(CosechaConCosechasDiarias(
            cosecha: c, cosechasdiarias: cosechasDiarias));
      }
      return cosechasConDiarias;
    } catch (e) {
      return [];
    }
  }

  Future<List<PodasConPodasDiarias>> getPodasPendientesSincronizar() async {
    try {
      final PodaDao podaDao = db.podaDao;
      List<PodasConPodasDiarias> podasConDiarias = [];
      final podas = await podaDao.getPodasForSync();
      for (var p in podas) {
        final podasDiarias = await podaDao.getPodasDiariasForSync(p!.id);
        podasConDiarias
            .add(PodasConPodasDiarias(poda: p, podasDiarias: podasDiarias));
      }
      return podasConDiarias;
    } catch (e) {
      return [];
    }
  }

  Future<List<PlateoConPlateosDiarias>>
      getPlateosPendientesSincronizar() async {
    try {
      final PlateoDao plateoDao = db.plateoDao;
      List<PlateoConPlateosDiarias> plateoConDiarias = [];
      final plateos = await plateoDao.getPlateosForSync();
      for (var p in plateos) {
        final plateosDiarias = await plateoDao.getPlateosDiariasForSync(p!.id!);
        plateoConDiarias.add(
            PlateoConPlateosDiarias(plateo: p, plateosDiarias: plateosDiarias));
      }
      return plateoConDiarias;
    } catch (e) {
      return [];
    }
  }

  void getPalmasPendientesSincronizar() {}
  void getEnfermedadesPendientesSincronizar() {}
}

import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/data/remote/sync_to_server_remote.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/moor/daos/daos.dart';
import '../../data/moor/tables/tables.dart';
import '../../main.dart';
import '../../utils/form_status.dart';

part 'sync_to_server_state.dart';

enum SyncStatus { initial, loading, success, error }

class SyncToServerCubit extends Cubit<SyncToServerState> {
  SyncToServerCubit() : super(const SyncToServerState());
  final db = getIt<AppDatabase>();
  final remote = SyncToServerRemote();
  void getRegistrosPendientes() async {
    emit(const SyncToServerState());
    final cosechasPendientes = await getCosechasPendientesSincronizar();
    final podasPendientes = await getPodasPendientesSincronizar();
    final plateosPendientes = await getPlateosPendientesSincronizar();

    final palmasPendientes = await getPalmasPendientesSincronizar();
    final enfermedadesPendientes = await getEnfermedadesPendientesSincronizar();
    final tratamientosPendientes = await getTratamientosPendientesSincronizar();
    final erradicacionesPendientes =
        await getErradicacionesPendientesSincronizar();

    final censosPendientes = await getCensosPendientesSincronizar();
    final fumigacionesPendientes = await getFumigacionesPendientesSincronizar();

    //Fitosanitarias
    emit(state.copyWith(
        cosechasConDiariasPendientes: cosechasPendientes,
        podasConDiariasPendientes: podasPendientes,
        plateosConDiariasPendientes: plateosPendientes,
        palmasPendientes: palmasPendientes,
        enfermedadesPendientes: enfermedadesPendientes,
        tratamientosPendientes: tratamientosPendientes,
        erradicacionesPendientes: erradicacionesPendientes,
        censosPendientes: censosPendientes,
        fumigacionesPendientes: fumigacionesPendientes,
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
        final plateosDiarias = await plateoDao.getPlateosDiariasForSync(p!.id);
        plateoConDiarias.add(
            PlateoConPlateosDiarias(plateo: p, plateosDiarias: plateosDiarias));
      }
      return plateoConDiarias;
    } catch (e) {
      return [];
    }
  }

  Future<List<Palma>> getPalmasPendientesSincronizar() async {
    try {
      final PalmaDao palmasDao = db.palmaDao;
      final palmas = await palmasDao.getPalmasForSync();
      return palmas;
    } catch (e) {
      return [];
    }
  }

  Future<List<RegistroEnfermedadData>>
      getEnfermedadesPendientesSincronizar() async {
    try {
      final PalmaDao palmasDao = db.palmaDao;
      final registrosEnfermedades =
          await palmasDao.getRegistrosEnfermedadesForSync();
      return registrosEnfermedades;
    } catch (e) {
      return [];
    }
  }

  Future<List<RegistroTratamientoData>>
      getTratamientosPendientesSincronizar() async {
    try {
      final PalmaDao palmasDao = db.palmaDao;
      final registrosTratamientos =
          await palmasDao.getRegistrosTratamientosForSync();
      return registrosTratamientos;
    } catch (e) {
      return [];
    }
  }

  Future<List<ErradicacionData>>
      getErradicacionesPendientesSincronizar() async {
    try {
      final ErradicacionesDao erradicacionesDao = db.erradicacionesDao;
      final registroErradicaciones =
          await erradicacionesDao.getRegistrosForSync();
      return registroErradicaciones;
    } catch (e) {
      return [];
    }
  }

  Future<List<CensoData>> getCensosPendientesSincronizar() async {
    try {
      final PlagasDao plagasDao = db.plagasDao;
      final registroCensos = await plagasDao.getCensosForSync();
      return registroCensos;
    } catch (e) {
      return [];
    }
  }

  Future<List<Aplicacione>> getFumigacionesPendientesSincronizar() async {
    try {
      final FumigacionDao fumigacionDao = db.fumigacionDao;
      final registroFumigaciones = await fumigacionDao.getRegistrosForSync();
      return registroFumigaciones;
    } catch (e) {
      return [];
    }
  }

  syncRegistros() async {
    if (state.palmasPendientes != null &&
        state.palmasPendientes!.isNotEmpty &&
        state.palmasStatus != SyncStatus.success) {
      final respalmas = await syncPalmas();
    }
    if (state.enfermedadesPendientes != null &&
        state.enfermedadesPendientes!.isNotEmpty &&
        state.enfermedadesStatus != SyncStatus.success) {
      final resenfermedades = await syncEnfermedades();
    }
    if (state.cosechasConDiariasPendientes != null &&
        state.cosechasConDiariasPendientes!.isNotEmpty &&
        state.cosechasStatus != SyncStatus.success) {
      final respalmas = await syncCosechas();
    }
    if (state.tratamientosPendientes != null &&
        state.tratamientosPendientes!.isNotEmpty &&
        state.tratamientosStatus != SyncStatus.success) {
      final respalmas = await syncTratamientos();
    }
    //    if (state.cosechasConDiariasPendientes != null &&
    //     state.cosechasConDiariasPendientes!.isNotEmpty) {
    //   final respalmas = await syncPlateos();
    // }
    //    if (state.cosechasConDiariasPendientes != null &&
    //     state.cosechasConDiariasPendientes!.isNotEmpty) {
    //   final respalmas = await syncPodas();
    // }
  }

  Future<bool> syncCosechas() async {
    try {
      emit(state.copyWith(cosechasStatus: SyncStatus.loading));
      final res = await remote
          .syncCosechasConDiarias(state.cosechasConDiariasPendientes ?? []);
      if (res) {
        final CosechaDao cosechaDao = db.cosechaDao;
        for (var i in state.cosechasConDiariasPendientes!) {
          await cosechaDao.updateSyncCosecha(i.cosecha, i.cosechasdiarias);
        }
        emit(state.copyWith(cosechasStatus: SyncStatus.success));
        return true;
      } else {
        emit(state.copyWith(cosechasStatus: SyncStatus.error));
        return false;
      }
    } catch (e) {
      emit(state.copyWith(cosechasStatus: SyncStatus.error));
      return false;
    }
  }

  Future<bool> syncPalmas() async {
    try {
      emit(state.copyWith(palmasStatus: SyncStatus.loading));
      final res = await remote.syncPalmas(state.palmasPendientes ?? []);
      if (res) {
        final PalmaDao palmasDao = db.palmaDao;
        for (var i in state.palmasPendientes!) {
          await palmasDao.updateSyncPalmas(i);
        }
        emit(state.copyWith(palmasStatus: SyncStatus.success));
        return true;
      } else {
        emit(state.copyWith(palmasStatus: SyncStatus.error));
        return false;
      }
    } catch (e) {
      emit(state.copyWith(palmasStatus: SyncStatus.error));
      return false;
    }
  }

  Future<bool> syncEnfermedades() async {
    try {
      emit(state.copyWith(enfermedadesStatus: SyncStatus.loading));
      final res =
          await remote.syncEnfermedades(state.enfermedadesPendientes ?? []);
      if (res) {
        final RegistroEnfermedadDao registroEnfermedadDao =
            db.registroEnfermedadDao;
        for (var i in state.enfermedadesPendientes!) {
          await registroEnfermedadDao.updateSyncRegistro(i);
        }
        emit(state.copyWith(enfermedadesStatus: SyncStatus.success));
        return true;
      } else {
        emit(state.copyWith(enfermedadesStatus: SyncStatus.error));
        return false;
      }
    } catch (e) {
      emit(state.copyWith(enfermedadesStatus: SyncStatus.error));
      return false;
    }
  }

  Future<bool> syncTratamientos() async {
    try {
      emit(state.copyWith(tratamientosStatus: SyncStatus.loading));
      final res =
          await remote.syncTratamientos(state.tratamientosPendientes ?? []);
      if (res) {
        final PalmaDao palmaDao = db.palmaDao;
        for (var i in state.tratamientosPendientes!) {
          await palmaDao.updateSyncTratamientos(i);
        }
        emit(state.copyWith(tratamientosStatus: SyncStatus.success));
        return true;
      } else {
        emit(state.copyWith(tratamientosStatus: SyncStatus.error));
        return false;
      }
    } catch (e) {
      emit(state.copyWith(tratamientosStatus: SyncStatus.error));
      return false;
    }
  }
}

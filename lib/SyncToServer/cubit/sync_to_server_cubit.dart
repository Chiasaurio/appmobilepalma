import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/data/remote/sync_to_server_remote.dart';
import 'package:drift/drift.dart';
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
    final fertilizacionesPendientes =
        await getFertlizacionesPendientesSincronizar();

    final palmasPendientes = await getPalmasPendientesSincronizar();
    final enfermedadesPendientes = await getEnfermedadesPendientesSincronizar();
    final tratamientosPendientes = await getTratamientosPendientesSincronizar();
    final erradicacionesPendientes =
        await getErradicacionesPendientesSincronizar();

    final censosPendientes = await getCensosPendientesSincronizar();
    final fumigacionesPendientes = await getFumigacionesPendientesSincronizar();

    final viajesPendientes = await getViajesPendientesSync();

    //Fitosanitarias
    emit(state.copyWith(
        cosechasConDiariasPendientes: cosechasPendientes,
        podasConDiariasPendientes: podasPendientes,
        plateosConDiariasPendientes: plateosPendientes,
        fertilizacionesConDiariasPendientes: fertilizacionesPendientes,
        palmasPendientes: palmasPendientes,
        enfermedadesPendientes: enfermedadesPendientes,
        tratamientosPendientes: tratamientosPendientes,
        erradicacionesPendientes: erradicacionesPendientes,
        censosPendientes: censosPendientes,
        fumigacionesPendientes: fumigacionesPendientes,
        viajesPendientes: viajesPendientes,
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

  Future<List<FertilizacionConFertilizacionesDiarias>>
      getFertlizacionesPendientesSincronizar() async {
    try {
      final FertilizacionDao fertilizacionDao = db.fertilizacionDao;
      List<FertilizacionConFertilizacionesDiarias> fertilizacionConDiarias = [];
      final fertilizaciones = await fertilizacionDao.getFertilizacionForSync();
      for (var f in fertilizaciones) {
        final fertilizacionesDiarias =
            await fertilizacionDao.getFertilizacionesDiariasForSync(f!.id);
        fertilizacionConDiarias.add(FertilizacionConFertilizacionesDiarias(
            fertilizacion: f, fertilizacionesDiarias: fertilizacionesDiarias));
      }
      return fertilizacionConDiarias;
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

  Future<List<Viaje>> getViajesPendientesSync() async {
    try {
      final ViajesDao viajesDao = db.viajesDao;
      final registroViajes = await viajesDao.getRegistrosForSync();
      return registroViajes;
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
    if (state.tratamientosPendientes != null &&
        state.tratamientosPendientes!.isNotEmpty &&
        state.tratamientosStatus != SyncStatus.success) {
      final respalmas = await syncTratamientos();
    }
    if (state.cosechasConDiariasPendientes != null &&
        state.cosechasConDiariasPendientes!.isNotEmpty &&
        state.cosechasStatus != SyncStatus.success) {
      final respalmas = await syncCosechas();
    }
    if (state.podasConDiariasPendientes != null &&
        state.podasConDiariasPendientes!.isNotEmpty &&
        state.podasStatus != SyncStatus.success) {
      final respalmas = await syncPodas();
    }
    if (state.plateosConDiariasPendientes != null &&
        state.plateosConDiariasPendientes!.isNotEmpty &&
        state.plateosStatus != SyncStatus.success) {
      final rescosechas = await syncPlateos();
    }
    if (state.fertilizacionesConDiariasPendientes != null &&
        state.fertilizacionesConDiariasPendientes!.isNotEmpty &&
        state.fertilizacionesStatus != SyncStatus.success) {
      final resfertilizaciones = await syncFertilizaciones();
    }
    if (state.viajesPendientes != null &&
        state.viajesPendientes!.isNotEmpty &&
        state.viajesStatus != SyncStatus.success) {
      final resviajes = await syncViajes();
    }
  }

  Future<bool> syncCosechas() async {
    try {
      emit(state.copyWith(cosechasStatus: SyncStatus.loading));
      final res = await remote
          .syncCosechasConDiarias(state.cosechasConDiariasPendientes ?? []);
      if (res["success"]) {
        final CosechaDao cosechaDao = db.cosechaDao;
        var index = 0;
        var ids = res["cosechasIds"];
        //Toca actualizar los ids locales con los que llegan
        for (var cosecha in state.cosechasConDiariasPendientes!) {
          if (ids[index] > -1) {
            //si agrego la cosecha, toca actualizar el id
            await cosechaDao.updateCosecha(
                cosecha.cosecha.copyWith(idCosecha: Value(ids[index])));
          }
          index++;
        }

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

  Future<bool> syncPlateos() async {
    try {
      emit(state.copyWith(plateosStatus: SyncStatus.loading));
      final res = await remote
          .syncPlateosConDiarias(state.plateosConDiariasPendientes ?? []);
      if (res["success"]) {
        final PlateoDao plateoDao = db.plateoDao;
        var index = 0;
        var ids = res["plateosIds"];
        //Toca actualizar los ids locales con los que llegan
        for (var plateo in state.plateosConDiariasPendientes!) {
          if (ids[index] > -1) {
            //si agrego la cosecha, toca actualizar el id
            await plateoDao.updatePlateo(
                plateo.plateo.copyWith(idPlateo: Value(ids[index])));
          }
          index++;
        }
        for (var i in state.plateosConDiariasPendientes!) {
          await plateoDao.updateSyncPlateo(i.plateo, i.plateosDiarias);
        }
        emit(state.copyWith(plateosStatus: SyncStatus.success));
        return true;
      } else {
        emit(state.copyWith(plateosStatus: SyncStatus.error));
        return false;
      }
    } catch (e) {
      emit(state.copyWith(plateosStatus: SyncStatus.error));
      return false;
    }
  }

  Future<bool> syncFertilizaciones() async {
    try {
      emit(state.copyWith(fertilizacionesStatus: SyncStatus.loading));
      final res = await remote.syncFertilizacionesConDiarias(
          state.fertilizacionesConDiariasPendientes ?? []);
      if (res["success"]) {
        final FertilizacionDao fertilizacionDao = db.fertilizacionDao;
        var index = 0;
        var ids = res["fertilizacionesIds"];
        //Toca actualizar los ids locales con los que llegan
        for (var fertilizacion in state.fertilizacionesConDiariasPendientes!) {
          if (ids[index] > -1) {
            //si agrego la cosecha, toca actualizar el id
            await fertilizacionDao.updateFertilizacion(fertilizacion
                .fertilizacion
                .copyWith(idFertilizacion: Value(ids[index])));
          }
          index++;
        }
        for (var i in state.fertilizacionesConDiariasPendientes!) {
          await fertilizacionDao.updateSyncFertilizacion(
              i.fertilizacion, i.fertilizacionesDiarias);
        }
        emit(state.copyWith(fertilizacionesStatus: SyncStatus.success));
        return true;
      } else {
        emit(state.copyWith(fertilizacionesStatus: SyncStatus.error));
        return false;
      }
    } catch (e) {
      emit(state.copyWith(fertilizacionesStatus: SyncStatus.error));
      return false;
    }
  }

  Future<bool> syncPodas() async {
    try {
      emit(state.copyWith(podasStatus: SyncStatus.loading));
      final res = await remote
          .syncPodasConDiarias(state.podasConDiariasPendientes ?? []);
      if (res["success"]) {
        final PodaDao podaDao = db.podaDao;
        var index = 0;
        var ids = res["podasIds"];
        //Toca actualizar los ids locales con los que llegan
        for (var poda in state.podasConDiariasPendientes!) {
          if (ids[index] > -1) {
            //si agrego la poda, toca actualizar el id
            await podaDao
                .updatePoda(poda.poda.copyWith(idPoda: Value(ids[index])));
          }
          index++;
        }

        for (var i in state.podasConDiariasPendientes!) {
          await podaDao.updateSyncPoda(i.poda, i.podasDiarias);
        }
        emit(state.copyWith(podasStatus: SyncStatus.success));
        return true;
      } else {
        emit(state.copyWith(podasStatus: SyncStatus.error));
        return false;
      }
    } catch (e) {
      emit(state.copyWith(podasStatus: SyncStatus.error));
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
      // <--- Primero obtenemos la enfermedad-->
      final RegistroEnfermedadDao registroEnfermedadDao =
          db.registroEnfermedadDao;
      List<RegistroEnfermedadData> registroEnfermedades = [];
      for (var tratamiento in state.tratamientosPendientes!) {
        final registroEnfermedad =
            await registroEnfermedadDao.getRegistroEnfermedad(tratamiento.id);
        if (registroEnfermedad != null) {
          registroEnfermedades.add(registroEnfermedad);
        }
      }

      // <--- Luego obtenenemos los ids de la base de datos central, para evitar conflictos -->
      final registrosEnfermedadesIDS =
          await remote.getRegistroEnfermedadesIds(registroEnfermedades);
      // <--- Creamos nuevo array con nuevos Ids, -->
      List<RegistroTratamientoData> nuevosTratamientos = [];
      int i = 0;
      for (var tratamiento in state.tratamientosPendientes!) {
        nuevosTratamientos.add(tratamiento.copyWith(
            idRegistroEnfermedad: registrosEnfermedadesIDS[i]));
        i++;
      }

      // <--- Enviamos los tratamientos con los ids correctos, -->
      final res = await remote.syncTratamientos(nuevosTratamientos);
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

  Future<bool> syncViajes() async {
    try {
      emit(state.copyWith(viajesStatus: SyncStatus.loading));
      final res = await remote.syncViajes(state.viajesPendientes ?? []);
      if (res["success"]) {
        final ViajesDao viajesDao = db.viajesDao;
        var index = 0;
        var ids = res["viajesIds"];
        //Toca actualizar los ids locales con los que llegan
        for (var viaje in state.viajesPendientes!) {
          if (ids[index] > -1) {
            //si agrego el viaje se actualiza el id
            await viajesDao
                .updateViaje(viaje.copyWith(idViaje: Value(ids[index])));
          }
          index++;
        }
        for (var i in state.viajesPendientes!) {
          await viajesDao.updateSyncViaje(i);
        }
        emit(state.copyWith(viajesStatus: SyncStatus.success));
        return true;
      } else {
        emit(state.copyWith(viajesStatus: SyncStatus.error));
        return false;
      }
    } catch (e) {
      emit(state.copyWith(viajesStatus: SyncStatus.error));
      return false;
    }
  }
}

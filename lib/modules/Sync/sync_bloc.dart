import 'package:apppalma/modules/Sync/sync_files/sync_enfermedades.dart';
import 'package:apppalma/modules/Sync/sync_files/sync_lotes.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:drift/drift.dart';

import 'sync_files/sync_agroquimicos.dart';
import 'sync_files/sync_plagas.dart';

class SyncBloc {
  SyncLotes synclotes = SyncLotes();
  SyncEnfermedades syncenfermedades = SyncEnfermedades();
  SyncPlagas syncplagas = SyncPlagas();
  SyncProductosAgroquimicos syncproductos = SyncProductosAgroquimicos();

  Future<List<Insertable<Lote>>> getLotesRemote() async {
    try {
      List<Insertable<Lote>> datalotes = await synclotes.getLotesRemoteSource();
      return datalotes;
    } catch (e) {
      return [];
    }
  }

  Future<Map<String, List>> getEnfermedadesConEtapasRemote() async {
    try {
      List<Insertable<Enfermedade>> dataenfermedades =
          await syncenfermedades.getEnfermedadesRemoteSource();
      List<Insertable<Etapa>> dataetapas =
          await syncenfermedades.getEtapasEnfermedades();
      Map<String, List> map = {
        "enfermedades": dataenfermedades,
        "etapas": dataetapas
      };
      return map;
    } catch (e) {
      return {};
    }
  }

  Future<Map<String, List>> getPlagasRemote() async {
    try {
      List<Insertable<Plaga>> dataplagas = await syncplagas.getPlagas();
      List<Insertable<EtapasPlagaData>> dataetapas =
          await syncplagas.getEtapasPlagas();
      Map<String, List> map = {"plagas": dataplagas, "etapas": dataetapas};
      return map;
    } catch (e) {
      return {};
    }
  }

  Future<Map<String, List>> getAgroquimicosRemote() async {
    try {
      List<Insertable<ProductoAgroquimicoData>> dataproductos =
          await syncproductos.getProductos();
      Map<String, List> map = {"productos": dataproductos};
      return map;
    } catch (e) {
      return {};
    }
  }
}

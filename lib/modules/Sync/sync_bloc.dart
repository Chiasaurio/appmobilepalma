import 'package:apppalma/modules/LotesList/cubit/loteslist_cubit.dart';
import 'package:apppalma/modules/Sync/sync_files/sync_enfermedades.dart';
import 'package:apppalma/modules/Sync/sync_files/sync_lotes.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/plagas_table.dart';
import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sync_files/sync_plagas.dart';

class SyncBloc {
  SyncLotes synclotes = SyncLotes();
  SyncEnfermedades syncenfermedades = SyncEnfermedades();
  SyncPlagas syncplagas = SyncPlagas();
  // SyncProductosAgroquimicos syncproductos = SyncProductosAgroquimicos();

  Future<List<Insertable<Lote>>> insertarLotes() async {
    try {
      List<Insertable<Lote>> datalotes = await synclotes.getLotesRemoteSource();
      return datalotes;
    } catch (e) {
      return [];
    }
  }

  Future<Map<String, List>> insertarEnfermedades() async {
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

  Future<Map<String, List>> insertarPlagas() async {
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
}

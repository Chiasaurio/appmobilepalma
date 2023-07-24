import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/data/moor/tables/censo_table.dart';
import 'package:apppalma/data/moor/tables/plagas_table.dart';
import 'package:apppalma/presentation/modules/Plagas/models/etapa_individuo_model.dart';
import 'package:apppalma/utils/get_location.dart';
import 'package:drift/drift.dart';
import 'package:apppalma/globals.dart' as globals;
import 'package:location/location.dart';

part 'plagas_daos.g.dart';

@DriftAccessor(tables: [
  Plagas,
  EtapasPlaga,
  Censo,
  CensoEtapasPlaga
], queries: {
  'getIdCenso': 'SELECT * FROM censo ORDER BY id_censo DESC LIMIT 1;'
})
class PlagasDao extends DatabaseAccessor<AppDatabase> with _$PlagasDaoMixin {
  PlagasDao(AppDatabase db) : super(db);

  Future<List<PlagaConEtapas>> obtenerPlagaConEtapas() async {
    final rows = (select(plagas))
        .join(
          [
            leftOuterJoin(etapasPlaga,
                etapasPlaga.nombrePlaga.equalsExp(plagas.nombreComunPlaga)),
          ],
        )
        .watch()
        .map((rows) {
          final groupedData = <Plaga, List<EtapasPlagaData>>{};

          for (final row in rows) {
            final plaga = row.readTable(plagas);
            final etapa = row.readTableOrNull(etapasPlaga);
            final list = groupedData.putIfAbsent(plaga, () => []);
            if (etapa != null) list.add(etapa);
          }
          return [
            for (final entry in groupedData.entries)
              PlagaConEtapas(plaga: entry.key, etapas: entry.value)
          ];
        });
    final resp = await rows.first;

    return resp;
  }

  Future<Plaga?> getPlagaUltimo() async {
    final query = (select(plagas));
    query.orderBy([(tbl) => OrderingTerm.desc(tbl.fechaUltimaActualizacion)]);

    final res = await query.get();

    return res[0];
  }

  Future<void> insertPlagas(List<Insertable<Plaga>> listaplagas,
      List<Insertable<EtapasPlagaData>> listaetapas) async {
    try {
      await batch((b) {
        b.insertAllOnConflictUpdate(plagas, listaplagas);

        // for (final plaga in listaplagas) {
        //   b.insert(
        //     plagas,s
        //     plaga,
        //     onConflict: DoUpdate(
        //       (_) => plaga,
        //       // upsert will happen if it conflicts with columnA and columnB
        //       target: [plagas.nombreComunPlaga],
        //     ),
        //   );
        // }
      });
      await batch((b) {
        b.insertAllOnConflictUpdate(etapasPlaga, listaetapas);
        // for (final etapa in listaetapas) {
        //   b.insert(
        //     etapasPlaga,
        //     etapa,
        //     onConflict: DoUpdate(
        //       (_) => etapa,
        //       // upsert will happen if it conflicts with columnA and columnB
        //       target: [etapasPlaga.nombrePlaga, etapasPlaga.nombreEtapa],
        //     ),
        //   );
        //   // mode: InsertMode.insertOrReplace);
        // }
      });
    } catch (_) {}
  }

  Future insertPlagaConEtapas(
      Insertable<Plaga> plaga, List<Insertable<EtapasPlagaData>> listaetapas) {
    return transaction(() async {
      await into(plagas).insert(plaga);
      for (var element in listaetapas) {
        await into(etapasPlaga).insert(element);
      }
    });
  }

  Future<List<CensoData>> obtenerTodosCensos() {
    return (select(censo)).get();
  }

  Future<List<CensoData>> getCensosForSync() {
    return (select(censo)..where((tbl) => tbl.sincronizado.equals(false)))
        .get();
  }

  Future<List<CensoData>> getCensosPendientes() {
    return (select(censo)..where((tbl) => tbl.estadoPlaga.equals('pendiente')))
        .get();
  }

  Future<List<CensoData>> getCensosFumigados() {
    return (select(censo)..where((tbl) => tbl.estadoPlaga.equals('fumigado')))
        .get();
  }

  Future<CensoData> obtenerCenso(
      String nombrelote, DateTime fecha, String identificador) {
    return (select(censo)
          ..where((c) =>
              c.nombreLote.equals(nombrelote) &
              c.fechaCenso.equals(fecha) &
              c.identificador.equals(identificador)))
        .getSingle();
  }

  Future updateCenso(Insertable<CensoData> c) => update(censo).replace(c);

  Future<void> insertCensoDePlaga(
      DateTime fechacenso,
      // bool presencialote,
      // bool presenciasector,
      // int linealimite1,
      // int linealimite2,
      // int? linea,
      // int? numero,
      // String? orientacion,
      String identificadorPalma,
      int? numeroIndividuos,
      String? observacion,
      String nombreCientifico,
      String nombrelote,
      List<EtapaIndividuosModel> etapasseleccionadas) async {
    try {
      final LocationData? locationData = await getCurrentLocation();
      final c = CensoCompanion(
          fechaCenso: Value(fechacenso),
          // presenciaLote: Value(presencialote),
          // presenciaSector: Value(presenciasector),
          // lineaLimite1: Value(linealimite1),
          // lineaLimite2: Value(linealimite2),
          identificador: Value(identificadorPalma),
          responsable: Value(globals.responsable),
          numeroIndividuos: Value(numeroIndividuos),
          observacionCenso: Value(observacion),
          nombrePlaga: Value(nombreCientifico),
          nombreLote: Value(nombrelote),
          longitude: Value(locationData?.longitude),
          latitude: Value(locationData?.latitude));

      return transaction(() async {
        var id = await into(censo).insert(c);
        // CensoData ultimoid = await getIdCenso().getSingle();
        List<Insertable<CensoEtapasPlagaData>> etapas =
            getCensoEtapasCompanion(id, etapasseleccionadas);
        await batch((batch) {
          batch.insertAll(censoEtapasPlaga, etapas);
        });
      });
    } catch (_) {}
  }

  List<Insertable<CensoEtapasPlagaData>> getCensoEtapasCompanion(
      int idCenso, List<EtapaIndividuosModel> etapasseleccionadas) {
    List<Insertable<CensoEtapasPlagaData>> etapas = [];
    for (var e in etapasseleccionadas) {
      CensoEtapasPlagaCompanion aux = CensoEtapasPlagaCompanion(
          idCenso: Value(idCenso),
          idEtapasplaga: Value(e.etapa.idEtapasPlaga),
          numeroIndividuos: Value(e.individuos!));
      etapas.add(aux);
    }
    return etapas;
  }
}

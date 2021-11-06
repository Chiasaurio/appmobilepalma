import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/censo_table.dart';
import 'package:apppalma/moor/tables/plagas_table.dart';
import 'package:drift/drift.dart';

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

  Stream<List<PlagaConEtapas>> obtenerPlagaConEtapas() {
    final rows = (select(plagas)
          ..orderBy([
            (t) => OrderingTerm(
                expression: t.nombreComunPlaga, mode: OrderingMode.asc),
          ]))
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
            final etapa = row.readTable(etapasPlaga);

            final list = groupedData.putIfAbsent(plaga, () => []);
            if (etapa != null) list.add(etapa);
          }
          return [
            for (final entry in groupedData.entries)
              PlagaConEtapas(plaga: entry.key, etapas: entry.value)
          ];
        });

    return rows;
  }

  Future<void> insertPlagas(List<Insertable<Plaga>> listaplagas,
      List<Insertable<EtapasPlagaData>> listaetapas) async {
    try {
      await batch((b) {
        for (final plaga in listaplagas) {
          b.insert(
            plagas,
            plaga,
            onConflict: DoUpdate(
              (_) => plaga,
              // upsert will happen if it conflicts with columnA and columnB
              target: [plagas.nombreComunPlaga],
            ),
          );
        }
      });
      await batch((b) {
        for (final etapa in listaetapas) {
          b.insert(
            etapasPlaga,
            etapa,
            onConflict: DoUpdate(
              (_) => etapa,
              // upsert will happen if it conflicts with columnA and columnB
              target: [etapasPlaga.nombrePlaga, etapasPlaga.nombreEtapa],
            ),
          );
          // mode: InsertMode.insertOrReplace);
        }
      });
    } catch (e) {
      print('2');

      print(e);
    }
  }

  Future insertPlagaConEtapas(
      Insertable<Plaga> plaga, List<Insertable<EtapasPlagaData>> listaetapas) {
    return transaction(() async {
      await into(plagas).insert(plaga);
      listaetapas.forEach((element) async {
        await into(etapasPlaga).insert(element);
      });
    });
  }

  Future<List<CensoData>> obtenerTodosCensos() {
    return (select(censo)
          ..orderBy([(t) => OrderingTerm(expression: t.fechaCenso)]))
        .get();
  }

  Future<List<CensoData>> getCensosPendientes() {
    return (select(censo)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.fechaCenso, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.nombreLote)
          ])
          ..where((tbl) => tbl.estadoPlaga.equals('pendiente')))
        .get();
  }

  Future<List<CensoData>> getCensosFumigados() {
    return (select(censo)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.fechaCenso, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.nombreLote)
          ])
          ..where((tbl) => tbl.estadoPlaga.equals('fumigado')))
        .get();
  }

  Future<CensoData> obtenerCenso(
      String nombrelote, DateTime fecha, int linealimite1, int linealimite2) {
    return (select(censo)
          ..where((c) =>
              c.nombreLote.equals(nombrelote) &
              c.fechaCenso.equals(fecha) &
              c.lineaLimite1.equals(linealimite1) &
              c.lineaLimite2.equals(linealimite2)))
        .getSingle();
  }

  Future updateCenso(Insertable<CensoData> c) => update(censo).replace(c);

  Future insertCensoDePlaga(
      DateTime fechacenso,
      bool presencialote,
      bool presenciasector,
      int linealimite1,
      int linealimite2,
      String observacion,
      String nombreCientifico,
      String nombrelote,
      List<EtapasPlagaData> etapasseleccionadas) {
    final c = CensoCompanion(
      fechaCenso: Value(fechacenso),
      presenciaLote: Value(presencialote),
      presenciaSector: Value(presenciasector),
      lineaLimite1: Value(linealimite1),
      lineaLimite2: Value(linealimite2),
      observacionCenso: Value(observacion),
      nombrePlaga: Value(nombreCientifico),
      nombreLote: Value(nombrelote),
    );

    return transaction(() async {
      var id = await into(censo).insert(c);
      // CensoData ultimoid = await getIdCenso().getSingle();
      List<Insertable<CensoEtapasPlagaData>> etapas =
          getCensoEtapasCompanion(id, etapasseleccionadas);
      await batch((batch) {
        batch.insertAll(censoEtapasPlaga, etapas);
      });
    });
  }

  List<Insertable<CensoEtapasPlagaData>> getCensoEtapasCompanion(
      int idCenso, List<EtapasPlagaData> etapasseleccionadas) {
    List<Insertable<CensoEtapasPlagaData>> etapas = [];
    etapasseleccionadas.forEach((e) {
      CensoEtapasPlagaCompanion aux = CensoEtapasPlagaCompanion(
        idCenso: Value(idCenso),
        idEtapasplaga: Value(e.idEtapasPlaga),
      );
      etapas.add(aux);
    });
    return etapas;
  }
}

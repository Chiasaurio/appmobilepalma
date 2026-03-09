import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/data/moor/tables/censo_table.dart';
import 'package:apppalma/data/moor/tables/plagas_table.dart';
import 'package:drift/drift.dart';

part 'plagas_daos.g.dart';

@DriftAccessor(tables: [
  Plagas,
  EtapasPlaga,
  Censo,
  CensoEtapasPlaga,
  ImagenCensoPlaga
], queries: {
  'getIdCenso': 'SELECT * FROM censo ORDER BY id_censo DESC LIMIT 1;'
})
class PlagasDao extends DatabaseAccessor<AppDatabase> with _$PlagasDaoMixin {
  PlagasDao(super.db);

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
      });
      await batch((b) {
        b.insertAllOnConflictUpdate(etapasPlaga, listaetapas);
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

  Future<CensoData?> getRegistroCenso(int id) {
    return (select(censo)..where((r) => r.id.equals(id))).getSingleOrNull();
  }

  Future<List<CensoEtapasPlagaData>> getCensosEtapasForSync(CensoData censo) {
    return (select(censoEtapasPlaga)
          ..where(
              (i) => i.idCenso.equals(censo.id) & i.sincronizado.equals(false)))
        .get();
  }

  Future<List<ImagenCensoPlagaData>> getImagenesCensoForSync(CensoData censo) {
    return (select(imagenCensoPlaga)
          ..where(
              (i) => i.idCenso.equals(censo.id) & i.sincronizado.equals(false)))
        .get();
  }

  Future<List<CensoData>> getCensosPendientes(String nombreLote,
      [String? estado]) async {
    if (estado != null) {
      return await (select(censo)
            ..where((tbl) =>
                tbl.estadoPlaga.equals(estado) &
                tbl.nombreLote.equals(nombreLote)))
          .get();
    } else {
      return await (select(censo)
            ..where((tbl) => tbl.nombreLote.equals(nombreLote)))
          .get();
    }
  }

  Future<List<CensoData>> getCensosFumigados() {
    return (select(censo)..where((tbl) => tbl.estadoPlaga.equals('fumigado')))
        .get();
  }

  Future<CensoData> obtenerCenso(String nombrelote, DateTime fecha,
      int numeroLinea, int numeroPalma, String orientacion) {
    return (select(censo)
          ..where((c) =>
              c.nombreLote.equals(nombrelote) &
              c.fechaCenso.equals(fecha) &
              c.numerolinea.equals(numeroLinea) &
              c.numeroenlinea.equals(numeroPalma) &
              c.orientacion.equals(orientacion)))
        .getSingle();
  }

  Future updateCenso(Insertable<CensoData> c) => update(censo).replace(c);

  Future updateSyncCenso(CensoData c, List<CensoEtapasPlagaData> etapas) {
    return transaction(() async {
      await (update(censo)..where((t) => t.id.equals(c.id))).write(
        const CensoCompanion(
          sincronizado: Value(true),
        ),
      );
      for (var element in etapas) {
        await (update(censoEtapasPlaga)
              ..where((c) =>
                  c.idCensoEtapasplaga.equals(element.idCensoEtapasplaga)))
            .write(const CensoEtapasPlagaCompanion(
          sincronizado: Value(true),
        ));
      }
    });
  }
}

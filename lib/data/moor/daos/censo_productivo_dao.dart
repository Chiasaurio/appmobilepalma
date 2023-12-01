import 'package:apppalma/data/moor/moor_database.dart';
import '../tables/tables.dart';
import 'package:drift/drift.dart';

part 'censo_productivo_dao.g.dart';

@DriftAccessor(tables: [CensoProductivo])
class CensoProductivoDao extends DatabaseAccessor<AppDatabase>
    with _$CensoProductivoDaoMixin {
  final AppDatabase db;
  CensoProductivoDao(this.db) : super(db);

  Future<List<CensoProductivoData>> getCensos() {
    return (select(censoProductivo)).get();
  }

  Future<List<CensoProductivoData>> getCensosPorLote(String nombreLote) {
    return (select(censoProductivo)
          ..where((tbl) => tbl.nombreLote.equals(nombreLote)))
        .get();
  }

  Future<List<CensoProductivoData>> getCensosPendientesForSync() {
    return (select(censoProductivo)..where((c) => c.sincronizado.equals(false)))
        .get();
  }

  Future updateCensoSyncTrue(CensoProductivoData censo) {
    return (update(censoProductivo)..where((t) => t.id.equals(censo.id))).write(
      const CensoProductivoCompanion(
        sincronizado: Value(true),
      ),
    );
  }

  Future insertCenso(Insertable<CensoProductivoData> censo) =>
      into(censoProductivo).insert(censo);
  Future updateCenso(Insertable<CensoProductivoData> censo) =>
      update(censoProductivo).replace(censo);
  Future deleteCenso(Insertable<CensoProductivoData> censo) =>
      delete(censoProductivo).delete(censo);
}

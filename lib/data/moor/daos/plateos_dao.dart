import 'package:apppalma/data/moor/moor_database.dart';
import '../tables/tables.dart';
import 'package:drift/drift.dart';

part 'plateos_dao.g.dart';

@DriftAccessor(tables: [Plateos, PlateoDiario])
class PlateoDao extends DatabaseAccessor<AppDatabase> with _$PlateoDaoMixin {
  final AppDatabase db;
  PlateoDao(this.db) : super(db);

  Future<Plateo?> getPlateoActivo(String nombrelote) {
    return (select(plateos)
          ..where((c) =>
              c.completado.equals(false) & c.nombreLote.equals(nombrelote)))
        .getSingleOrNull();
  }

  Future insertPlateo(Insertable<Plateo> plateo) =>
      into(plateos).insert(plateo);
  Future updatePlateo(Insertable<Plateo> plateo) =>
      update(plateos).replace(plateo);
  Future deletePlateo(Insertable<Plateo> plateo) =>
      delete(plateos).delete(plateo);

  Future<List<PlateoDiarioData>> getPlateosDiarios(int id) {
    return (select(plateoDiario)..where((c) => c.idPlateo.equals(id))).get();
  }

  Future insertPlateoDiario(Insertable<PlateoDiarioData> plateodiario) =>
      into(plateoDiario).insert(plateodiario);

  Future<List<Plateo?>> getPlateosForSync() {
    return (select(plateos)..where((c) => c.sincronizado.equals(false))).get();
  }

  Future<List<PlateoDiarioData>> getPlateosDiariasForSync(int id) {
    return (select(plateoDiario)
          ..where((p) => p.idPlateo.equals(id) & p.sincronizado.equals(false)))
        .get();
  }

  Future updateSyncPlateo(
      Plateo plateo, List<PlateoDiarioData> plateosDiarios) {
    return transaction(() async {
      await (update(plateos)..where((t) => t.id.equals(plateo.id)))
          .write(const PlateosCompanion(
        sincronizado: Value(true),
      ));
      for (var element in plateosDiarios) {
        await (update(plateoDiario)..where((c) => c.id.equals(element.id)))
            .write(const PlateoDiarioCompanion(
          sincronizado: Value(true),
        ));
      }
    });
  }
}

import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/cosechas_table.dart';
import 'package:drift/drift.dart';

part 'cosecha_daos.g.dart';

@DriftAccessor(tables: [Cosechas, CosechaDiaria])
class CosechaDao extends DatabaseAccessor<AppDatabase> with _$CosechaDaoMixin {
  final AppDatabase db;
  CosechaDao(this.db) : super(db);

  Stream<List<Cosecha>> watchCosechasFinalizadas() {
    return (select(cosechas)..where((tbl) => tbl.completada.equals(true)))
        .watch();
  }

  Future<List<Cosecha>> getCosechasFinalizadas() {
    return (select(cosechas)..where((tbl) => tbl.completada.equals(true)))
        .get();
  }

  Stream<Cosecha> watchCosechaActiva(String nombrelote) {
    return (select(cosechas)
          ..where((c) =>
              c.completada.equals(false) & c.nombreLote.equals(nombrelote)))
        .watchSingle();
  }

  Future<Cosecha?> getCosechaActiva(String nombrelote) {
    return (select(cosechas)
          ..where((c) =>
              c.completada.equals(false) & c.nombreLote.equals(nombrelote)))
        .getSingleOrNull();
  }

  Future<List<Cosecha?>> getCosechasForSync() {
    return (select(cosechas)..where((c) => c.sincronizado.equals(false))).get();
  }

  Future insertCosecha(Insertable<Cosecha> cosecha) =>
      into(cosechas).insert(cosecha);
  Future updateCosecha(Insertable<Cosecha> cosecha) =>
      update(cosechas).replace(cosecha);
  Future deleteCosecha(Insertable<Cosecha> cosecha) =>
      delete(cosechas).delete(cosecha);
}

@DriftAccessor(tables: [CosechaDiaria, Cosechas])
class CosechaDiariaDao extends DatabaseAccessor<AppDatabase>
    with _$CosechaDiariaDaoMixin {
  final AppDatabase db;
  CosechaDiariaDao(this.db) : super(db);

  Future<List<CosechaDiariaData>> getCosechasDiarias(int id) {
    return (select(cosechaDiaria)..where((c) => c.idCosecha.equals(id))).get();
  }

  Future<List<CosechaDiariaData>> getCosechasDiariasForSync(int id) {
    return (select(cosechaDiaria)
          ..where((c) => c.idCosecha.equals(id) & c.sincronizado.equals(false)))
        .get();
  }

  Stream<List<CosechaDiariaData>> watchCosechaDiaria() =>
      select(cosechaDiaria).watch();
  Future insertCosechaDiaria(Insertable<CosechaDiariaData> cosechadiaria) =>
      into(cosechaDiaria).insert(cosechadiaria);
}

import 'package:apppalma/data/moor/moor_database.dart';
import '../tables/tables.dart';
import 'package:drift/drift.dart';

part 'fertilizaciones_dao.g.dart';

@DriftAccessor(tables: [Fertilizaciones, FertilizacionDiaria])
class FertilizacionDao extends DatabaseAccessor<AppDatabase>
    with _$FertilizacionDaoMixin {
  final AppDatabase db;
  FertilizacionDao(this.db) : super(db);

  Future<Fertilizacione?> getFertilizacionActiva(String nombrelote) {
    return (select(fertilizaciones)
          ..where((c) =>
              c.completado.equals(false) & c.nombreLote.equals(nombrelote)))
        .getSingleOrNull();
  }

  Future insertFertilizacion(Insertable<Fertilizacione> fertilizacion) =>
      into(fertilizaciones).insert(fertilizacion);
  Future updateFertilizacion(Insertable<Fertilizacione> fertilizacion) =>
      update(fertilizaciones).replace(fertilizacion);
  Future deleteFertilizacion(Insertable<Fertilizacione> fertilizacion) =>
      delete(fertilizaciones).delete(fertilizacion);

  Future<List<FertilizacionDiariaData>> getFertilizacionesDiarias(int id) {
    return (select(fertilizacionDiaria)
          ..where((c) => c.idFertilizacion.equals(id)))
        .get();
  }

  Future insertFertilizacionDiaria(
          Insertable<FertilizacionDiariaData> fertilizacionDiariaData) =>
      into(fertilizacionDiaria).insert(fertilizacionDiariaData);

  Future<List<Fertilizacione?>> getFertilizacionForSync() {
    return (select(fertilizaciones)..where((c) => c.sincronizado.equals(false)))
        .get();
  }

  Future<List<FertilizacionDiariaData>> getFertilizacionesDiariasForSync(
      int id) {
    return (select(fertilizacionDiaria)
          ..where((p) =>
              p.idFertilizacion.equals(id) & p.sincronizado.equals(false)))
        .get();
  }

  Future updateSyncFertilizacion(Fertilizacione fertilizacion,
      List<FertilizacionDiariaData> fertilizacionesDiarias) {
    return transaction(() async {
      await (update(fertilizaciones)
            ..where((t) => t.id.equals(fertilizacion.id)))
          .write(const FertilizacionesCompanion(
        sincronizado: Value(true),
      ));
      for (var element in fertilizacionesDiarias) {
        await (update(fertilizacionDiaria)
              ..where((c) => c.id.equals(element.id)))
            .write(const FertilizacionDiariaCompanion(
          sincronizado: Value(true),
        ));
      }
    });
  }
}

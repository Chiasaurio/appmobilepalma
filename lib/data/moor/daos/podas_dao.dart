import 'package:apppalma/data/moor/moor_database.dart';
import '../tables/tables.dart';
import 'package:drift/drift.dart';

part 'podas_dao.g.dart';

@DriftAccessor(tables: [Podas, PodaDiaria])
class PodaDao extends DatabaseAccessor<AppDatabase> with _$PodaDaoMixin {
  final AppDatabase db;
  PodaDao(this.db) : super(db);

  Future<Poda?> getPodaActiva(String nombrelote) {
    return (select(podas)
          ..where((c) =>
              c.completada.equals(false) & c.nombreLote.equals(nombrelote)))
        .getSingleOrNull();
  }

  Future insertPoda(Insertable<Poda> poda) => into(podas).insert(poda);
  Future updatePoda(Insertable<Poda> poda) => update(podas).replace(poda);
  Future deletePoda(Insertable<Poda> poda) => delete(podas).delete(poda);

  Future<List<PodaDiariaData>> getPodasDiarias(int id) {
    return (select(podaDiaria)..where((c) => c.idPoda.equals(id))).get();
  }

  Future updateSyncPoda(Poda poda, List<PodaDiariaData> podasDiarias) {
    return transaction(() async {
      await (update(podas)..where((t) => t.id.equals(poda.id)))
          .write(const PodasCompanion(
        sincronizado: Value(true),
      ));
      for (var element in podasDiarias) {
        await (update(podaDiaria)..where((c) => c.id.equals(element.id)))
            .write(const PodaDiariaCompanion(
          sincronizado: Value(true),
        ));
      }
    });
  }

  Future insertPodaDiaria(Insertable<PodaDiariaData> podadiaria) =>
      into(podaDiaria).insert(podadiaria);

  Future<List<Poda>> getPodasFinalizadas() {
    return (select(podas)..where((tbl) => tbl.completada.equals(true))).get();
  }

  Future<List<Poda?>> getPodasForSync() {
    return (select(podas)..where((c) => c.sincronizado.equals(false))).get();
  }

  Future<List<PodaDiariaData>> getPodasDiariasForSync(int id) {
    return (select(podaDiaria)
          ..where((p) => p.idPoda.equals(id) & p.sincronizado.equals(false)))
        .get();
  }
}

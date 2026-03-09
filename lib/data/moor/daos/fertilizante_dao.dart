import 'package:apppalma/data/moor/moor_database.dart';
import '../tables/tables.dart';
import 'package:drift/drift.dart';

part 'fertilizante_dao.g.dart';

@DriftAccessor(tables: [Fertilizante])
class FertilizanteDao extends DatabaseAccessor<AppDatabase>
    with _$FertilizanteDaoMixin {
  final AppDatabase db;
  FertilizanteDao(this.db) : super(db);

  Future<List<FertilizanteData>> getFertilizantes() {
    return (select(fertilizante)).get();
  }

  Future insertProducto(Insertable<FertilizanteData> f) =>
      into(fertilizante).insert(f);

  Future<FertilizanteData?> getFertilizanteUltimo() async {
    final query = (select(fertilizante));
    query.orderBy([(tbl) => OrderingTerm.desc(tbl.fechaUltimaActualizacion)]);

    final res = await query.get();

    return res[0];
  }

  insertFertilizantes(
      List<Insertable<FertilizanteData>> listafertilizantes) async {
    try {
      await batch((b) {
        b.insertAllOnConflictUpdate(fertilizante, listafertilizantes);
      });
    } catch (_) {}
  }
}

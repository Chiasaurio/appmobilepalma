import 'package:apppalma/data/moor/moor_database.dart';
import '../tables/tables.dart';
import 'package:drift/drift.dart';

part 'erradicaciones_dao.g.dart';

@DriftAccessor(tables: [Erradicacion])
class ErradicacionesDao extends DatabaseAccessor<AppDatabase>
    with _$ErradicacionesDaoMixin {
  ErradicacionesDao(AppDatabase db) : super(db);

  Future insertErradicacion(Insertable<ErradicacionData> e) =>
      into(erradicacion).insert(e);

  Future<List<ErradicacionData>> getRegistrosForSync() {
    return (select(erradicacion)..where((c) => c.sincronizado.equals(false)))
        .get();
  }
}

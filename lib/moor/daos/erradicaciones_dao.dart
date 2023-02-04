import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/erradicacion_table.dart';
import 'package:drift/drift.dart';

part 'erradicaciones_dao.g.dart';

@DriftAccessor(tables: [Erradicacion])
class ErradicacionesDao extends DatabaseAccessor<AppDatabase>
    with _$ErradicacionesDaoMixin {
  ErradicacionesDao(AppDatabase db) : super(db);

  Future insertErradicacion(Insertable<ErradicacionData> e) =>
      into(erradicacion).insert(e);
}

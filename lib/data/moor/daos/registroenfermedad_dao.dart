import 'package:apppalma/data/moor/moor_database.dart';
import '../tables/tables.dart';
import 'package:drift/drift.dart';

part 'registroenfermedad_dao.g.dart';

@DriftAccessor(tables: [RegistroEnfermedad])
class RegistroEnfermedadDao extends DatabaseAccessor<AppDatabase>
    with _$RegistroEnfermedadDaoMixin {
  RegistroEnfermedadDao(AppDatabase db) : super(db);

  Future<RegistroEnfermedadData?> getRegistroEnfermedad(int id) {
    return (select(registroEnfermedad)..where((r) => r.id.equals(id)))
        .getSingleOrNull();
  }

  Future insertRegistroEnfermedad(Insertable<RegistroEnfermedadData> e) =>
      into(registroEnfermedad).insert(e);

  Future updateSyncRegistro(RegistroEnfermedadData e) {
    return (update(registroEnfermedad)..where((t) => t.id.equals(e.id))).write(
      const RegistroEnfermedadCompanion(
        sincronizado: Value(true),
      ),
    );
  }
}

import 'package:apppalma/data/moor/moor_database.dart';
import '../tables/tables.dart';
import 'package:drift/drift.dart';

part 'registroenfermedad_dao.g.dart';

@DriftAccessor(tables: [RegistroEnfermedad])
class RegistroEnfermedadDao extends DatabaseAccessor<AppDatabase>
    with _$RegistroEnfermedadDaoMixin {
  RegistroEnfermedadDao(AppDatabase db) : super(db);

  Future insertRegistroEnfermedad(Insertable<RegistroEnfermedadData> e) =>
      into(registroEnfermedad).insert(e);
}

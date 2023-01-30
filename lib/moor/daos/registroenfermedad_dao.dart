import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/registroenfermedad_table.dart';
import 'package:drift/drift.dart';

part 'registroenfermedad_dao.g.dart';

@DriftAccessor(tables: [RegistroEnfermedad])
class RegistroEnfermedadDao extends DatabaseAccessor<AppDatabase>
    with _$RegistroEnfermedadDaoMixin {
  RegistroEnfermedadDao(AppDatabase db) : super(db);

  Future insertRegistroEnfermedad(Insertable<RegistroEnfermedadData> e) =>
      into(registroEnfermedad).insert(e);
}

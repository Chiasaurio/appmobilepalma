// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'erradicaciones_dao.dart';

// ignore_for_file: type=lint
mixin _$ErradicacionesDaoMixin on DatabaseAccessor<AppDatabase> {
  $LotesTable get lotes => attachedDatabase.lotes;
  $PalmasTable get palmas => attachedDatabase.palmas;
  $ErradicacionTable get erradicacion => attachedDatabase.erradicacion;
  ErradicacionesDaoManager get managers => ErradicacionesDaoManager(this);
}

class ErradicacionesDaoManager {
  final _$ErradicacionesDaoMixin _db;
  ErradicacionesDaoManager(this._db);
  $$LotesTableTableManager get lotes =>
      $$LotesTableTableManager(_db.attachedDatabase, _db.lotes);
  $$PalmasTableTableManager get palmas =>
      $$PalmasTableTableManager(_db.attachedDatabase, _db.palmas);
  $$ErradicacionTableTableManager get erradicacion =>
      $$ErradicacionTableTableManager(_db.attachedDatabase, _db.erradicacion);
}

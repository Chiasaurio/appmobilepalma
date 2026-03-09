// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podas_dao.dart';

// ignore_for_file: type=lint
mixin _$PodaDaoMixin on DatabaseAccessor<AppDatabase> {
  $PodasTable get podas => attachedDatabase.podas;
  $PodaDiariaTable get podaDiaria => attachedDatabase.podaDiaria;
  PodaDaoManager get managers => PodaDaoManager(this);
}

class PodaDaoManager {
  final _$PodaDaoMixin _db;
  PodaDaoManager(this._db);
  $$PodasTableTableManager get podas =>
      $$PodasTableTableManager(_db.attachedDatabase, _db.podas);
  $$PodaDiariaTableTableManager get podaDiaria =>
      $$PodaDiariaTableTableManager(_db.attachedDatabase, _db.podaDiaria);
}

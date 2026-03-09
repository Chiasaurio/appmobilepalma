// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cosecha_daos.dart';

// ignore_for_file: type=lint
mixin _$CosechaDaoMixin on DatabaseAccessor<AppDatabase> {
  $ViajesTable get viajes => attachedDatabase.viajes;
  $CosechasTable get cosechas => attachedDatabase.cosechas;
  $CosechaDiariaTable get cosechaDiaria => attachedDatabase.cosechaDiaria;
  CosechaDaoManager get managers => CosechaDaoManager(this);
}

class CosechaDaoManager {
  final _$CosechaDaoMixin _db;
  CosechaDaoManager(this._db);
  $$ViajesTableTableManager get viajes =>
      $$ViajesTableTableManager(_db.attachedDatabase, _db.viajes);
  $$CosechasTableTableManager get cosechas =>
      $$CosechasTableTableManager(_db.attachedDatabase, _db.cosechas);
  $$CosechaDiariaTableTableManager get cosechaDiaria =>
      $$CosechaDiariaTableTableManager(_db.attachedDatabase, _db.cosechaDiaria);
}

mixin _$CosechaDiariaDaoMixin on DatabaseAccessor<AppDatabase> {
  $ViajesTable get viajes => attachedDatabase.viajes;
  $CosechasTable get cosechas => attachedDatabase.cosechas;
  $CosechaDiariaTable get cosechaDiaria => attachedDatabase.cosechaDiaria;
  CosechaDiariaDaoManager get managers => CosechaDiariaDaoManager(this);
}

class CosechaDiariaDaoManager {
  final _$CosechaDiariaDaoMixin _db;
  CosechaDiariaDaoManager(this._db);
  $$ViajesTableTableManager get viajes =>
      $$ViajesTableTableManager(_db.attachedDatabase, _db.viajes);
  $$CosechasTableTableManager get cosechas =>
      $$CosechasTableTableManager(_db.attachedDatabase, _db.cosechas);
  $$CosechaDiariaTableTableManager get cosechaDiaria =>
      $$CosechaDiariaTableTableManager(_db.attachedDatabase, _db.cosechaDiaria);
}

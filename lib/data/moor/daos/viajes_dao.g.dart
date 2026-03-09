// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viajes_dao.dart';

// ignore_for_file: type=lint
mixin _$ViajesDaoMixin on DatabaseAccessor<AppDatabase> {
  $ViajesTable get viajes => attachedDatabase.viajes;
  ViajesDaoManager get managers => ViajesDaoManager(this);
}

class ViajesDaoManager {
  final _$ViajesDaoMixin _db;
  ViajesDaoManager(this._db);
  $$ViajesTableTableManager get viajes =>
      $$ViajesTableTableManager(_db.attachedDatabase, _db.viajes);
}

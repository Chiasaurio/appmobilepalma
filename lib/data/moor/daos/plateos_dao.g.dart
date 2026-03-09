// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plateos_dao.dart';

// ignore_for_file: type=lint
mixin _$PlateoDaoMixin on DatabaseAccessor<AppDatabase> {
  $PlateosTable get plateos => attachedDatabase.plateos;
  $PlateoDiarioTable get plateoDiario => attachedDatabase.plateoDiario;
  PlateoDaoManager get managers => PlateoDaoManager(this);
}

class PlateoDaoManager {
  final _$PlateoDaoMixin _db;
  PlateoDaoManager(this._db);
  $$PlateosTableTableManager get plateos =>
      $$PlateosTableTableManager(_db.attachedDatabase, _db.plateos);
  $$PlateoDiarioTableTableManager get plateoDiario =>
      $$PlateoDiarioTableTableManager(_db.attachedDatabase, _db.plateoDiario);
}

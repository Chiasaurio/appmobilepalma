// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fumigacion_dao.dart';

// ignore_for_file: type=lint
mixin _$FumigacionDaoMixin on DatabaseAccessor<AppDatabase> {
  $CensoTable get censo => attachedDatabase.censo;
  $ProductoAgroquimicoTable get productoAgroquimico =>
      attachedDatabase.productoAgroquimico;
  $AplicacionesTable get aplicaciones => attachedDatabase.aplicaciones;
  FumigacionDaoManager get managers => FumigacionDaoManager(this);
}

class FumigacionDaoManager {
  final _$FumigacionDaoMixin _db;
  FumigacionDaoManager(this._db);
  $$CensoTableTableManager get censo =>
      $$CensoTableTableManager(_db.attachedDatabase, _db.censo);
  $$ProductoAgroquimicoTableTableManager get productoAgroquimico =>
      $$ProductoAgroquimicoTableTableManager(
        _db.attachedDatabase,
        _db.productoAgroquimico,
      );
  $$AplicacionesTableTableManager get aplicaciones =>
      $$AplicacionesTableTableManager(_db.attachedDatabase, _db.aplicaciones);
}

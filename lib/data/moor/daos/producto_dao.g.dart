// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producto_dao.dart';

// ignore_for_file: type=lint
mixin _$ProductoAgroquimicoDaoMixin on DatabaseAccessor<AppDatabase> {
  $ProductoAgroquimicoTable get productoAgroquimico =>
      attachedDatabase.productoAgroquimico;
  ProductoAgroquimicoDaoManager get managers =>
      ProductoAgroquimicoDaoManager(this);
}

class ProductoAgroquimicoDaoManager {
  final _$ProductoAgroquimicoDaoMixin _db;
  ProductoAgroquimicoDaoManager(this._db);
  $$ProductoAgroquimicoTableTableManager get productoAgroquimico =>
      $$ProductoAgroquimicoTableTableManager(
        _db.attachedDatabase,
        _db.productoAgroquimico,
      );
}

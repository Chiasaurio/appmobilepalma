// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'censo_productivo_dao.dart';

// ignore_for_file: type=lint
mixin _$CensoProductivoDaoMixin on DatabaseAccessor<AppDatabase> {
  $LotesTable get lotes => attachedDatabase.lotes;
  $CensoProductivoTable get censoProductivo => attachedDatabase.censoProductivo;
  CensoProductivoDaoManager get managers => CensoProductivoDaoManager(this);
}

class CensoProductivoDaoManager {
  final _$CensoProductivoDaoMixin _db;
  CensoProductivoDaoManager(this._db);
  $$LotesTableTableManager get lotes =>
      $$LotesTableTableManager(_db.attachedDatabase, _db.lotes);
  $$CensoProductivoTableTableManager get censoProductivo =>
      $$CensoProductivoTableTableManager(
        _db.attachedDatabase,
        _db.censoProductivo,
      );
}

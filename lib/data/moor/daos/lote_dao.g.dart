// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lote_dao.dart';

// ignore_for_file: type=lint
mixin _$LoteDaoMixin on DatabaseAccessor<AppDatabase> {
  $LotesTable get lotes => attachedDatabase.lotes;
  $ViajesTable get viajes => attachedDatabase.viajes;
  $CosechasTable get cosechas => attachedDatabase.cosechas;
  $PlateosTable get plateos => attachedDatabase.plateos;
  $PodasTable get podas => attachedDatabase.podas;
  $CensoTable get censo => attachedDatabase.censo;
  $PalmasTable get palmas => attachedDatabase.palmas;
  $PrecipitacionTable get precipitacion => attachedDatabase.precipitacion;
  $FertilizacionesTable get fertilizaciones => attachedDatabase.fertilizaciones;
  LoteDaoManager get managers => LoteDaoManager(this);
}

class LoteDaoManager {
  final _$LoteDaoMixin _db;
  LoteDaoManager(this._db);
  $$LotesTableTableManager get lotes =>
      $$LotesTableTableManager(_db.attachedDatabase, _db.lotes);
  $$ViajesTableTableManager get viajes =>
      $$ViajesTableTableManager(_db.attachedDatabase, _db.viajes);
  $$CosechasTableTableManager get cosechas =>
      $$CosechasTableTableManager(_db.attachedDatabase, _db.cosechas);
  $$PlateosTableTableManager get plateos =>
      $$PlateosTableTableManager(_db.attachedDatabase, _db.plateos);
  $$PodasTableTableManager get podas =>
      $$PodasTableTableManager(_db.attachedDatabase, _db.podas);
  $$CensoTableTableManager get censo =>
      $$CensoTableTableManager(_db.attachedDatabase, _db.censo);
  $$PalmasTableTableManager get palmas =>
      $$PalmasTableTableManager(_db.attachedDatabase, _db.palmas);
  $$PrecipitacionTableTableManager get precipitacion =>
      $$PrecipitacionTableTableManager(_db.attachedDatabase, _db.precipitacion);
  $$FertilizacionesTableTableManager get fertilizaciones =>
      $$FertilizacionesTableTableManager(
        _db.attachedDatabase,
        _db.fertilizaciones,
      );
}

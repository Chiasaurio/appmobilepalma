// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fertilizaciones_dao.dart';

// ignore_for_file: type=lint
mixin _$FertilizacionDaoMixin on DatabaseAccessor<AppDatabase> {
  $FertilizacionesTable get fertilizaciones => attachedDatabase.fertilizaciones;
  $FertilizanteTable get fertilizante => attachedDatabase.fertilizante;
  $FertilizacionDiariaTable get fertilizacionDiaria =>
      attachedDatabase.fertilizacionDiaria;
  FertilizacionDaoManager get managers => FertilizacionDaoManager(this);
}

class FertilizacionDaoManager {
  final _$FertilizacionDaoMixin _db;
  FertilizacionDaoManager(this._db);
  $$FertilizacionesTableTableManager get fertilizaciones =>
      $$FertilizacionesTableTableManager(
        _db.attachedDatabase,
        _db.fertilizaciones,
      );
  $$FertilizanteTableTableManager get fertilizante =>
      $$FertilizanteTableTableManager(_db.attachedDatabase, _db.fertilizante);
  $$FertilizacionDiariaTableTableManager get fertilizacionDiaria =>
      $$FertilizacionDiariaTableTableManager(
        _db.attachedDatabase,
        _db.fertilizacionDiaria,
      );
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palma_daos.dart';

// ignore_for_file: type=lint
mixin _$PalmaDaoMixin on DatabaseAccessor<AppDatabase> {
  $LotesTable get lotes => attachedDatabase.lotes;
  $PalmasTable get palmas => attachedDatabase.palmas;
  $EnfermedadesTable get enfermedades => attachedDatabase.enfermedades;
  $EtapasTable get etapas => attachedDatabase.etapas;
  $RegistroEnfermedadTable get registroEnfermedad =>
      attachedDatabase.registroEnfermedad;
  $ImagenRegistroEnfermedadTable get imagenRegistroEnfermedad =>
      attachedDatabase.imagenRegistroEnfermedad;
  $ProductoAgroquimicoTable get productoAgroquimico =>
      attachedDatabase.productoAgroquimico;
  $RegistroTratamientoTable get registroTratamiento =>
      attachedDatabase.registroTratamiento;
  $CensoTable get censo => attachedDatabase.censo;
  $PlagasTable get plagas => attachedDatabase.plagas;
  $EtapasPlagaTable get etapasPlaga => attachedDatabase.etapasPlaga;
  $CensoEtapasPlagaTable get censoEtapasPlaga =>
      attachedDatabase.censoEtapasPlaga;
  $ImagenCensoPlagaTable get imagenCensoPlaga =>
      attachedDatabase.imagenCensoPlaga;
  PalmaDaoManager get managers => PalmaDaoManager(this);
}

class PalmaDaoManager {
  final _$PalmaDaoMixin _db;
  PalmaDaoManager(this._db);
  $$LotesTableTableManager get lotes =>
      $$LotesTableTableManager(_db.attachedDatabase, _db.lotes);
  $$PalmasTableTableManager get palmas =>
      $$PalmasTableTableManager(_db.attachedDatabase, _db.palmas);
  $$EnfermedadesTableTableManager get enfermedades =>
      $$EnfermedadesTableTableManager(_db.attachedDatabase, _db.enfermedades);
  $$EtapasTableTableManager get etapas =>
      $$EtapasTableTableManager(_db.attachedDatabase, _db.etapas);
  $$RegistroEnfermedadTableTableManager get registroEnfermedad =>
      $$RegistroEnfermedadTableTableManager(
        _db.attachedDatabase,
        _db.registroEnfermedad,
      );
  $$ImagenRegistroEnfermedadTableTableManager get imagenRegistroEnfermedad =>
      $$ImagenRegistroEnfermedadTableTableManager(
        _db.attachedDatabase,
        _db.imagenRegistroEnfermedad,
      );
  $$ProductoAgroquimicoTableTableManager get productoAgroquimico =>
      $$ProductoAgroquimicoTableTableManager(
        _db.attachedDatabase,
        _db.productoAgroquimico,
      );
  $$RegistroTratamientoTableTableManager get registroTratamiento =>
      $$RegistroTratamientoTableTableManager(
        _db.attachedDatabase,
        _db.registroTratamiento,
      );
  $$CensoTableTableManager get censo =>
      $$CensoTableTableManager(_db.attachedDatabase, _db.censo);
  $$PlagasTableTableManager get plagas =>
      $$PlagasTableTableManager(_db.attachedDatabase, _db.plagas);
  $$EtapasPlagaTableTableManager get etapasPlaga =>
      $$EtapasPlagaTableTableManager(_db.attachedDatabase, _db.etapasPlaga);
  $$CensoEtapasPlagaTableTableManager get censoEtapasPlaga =>
      $$CensoEtapasPlagaTableTableManager(
        _db.attachedDatabase,
        _db.censoEtapasPlaga,
      );
  $$ImagenCensoPlagaTableTableManager get imagenCensoPlaga =>
      $$ImagenCensoPlagaTableTableManager(
        _db.attachedDatabase,
        _db.imagenCensoPlaga,
      );
}

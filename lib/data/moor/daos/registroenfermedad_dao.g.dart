// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registroenfermedad_dao.dart';

// ignore_for_file: type=lint
mixin _$RegistroEnfermedadDaoMixin on DatabaseAccessor<AppDatabase> {
  $LotesTable get lotes => attachedDatabase.lotes;
  $PalmasTable get palmas => attachedDatabase.palmas;
  $EnfermedadesTable get enfermedades => attachedDatabase.enfermedades;
  $EtapasTable get etapas => attachedDatabase.etapas;
  $RegistroEnfermedadTable get registroEnfermedad =>
      attachedDatabase.registroEnfermedad;
  $ImagenRegistroEnfermedadTable get imagenRegistroEnfermedad =>
      attachedDatabase.imagenRegistroEnfermedad;
  RegistroEnfermedadDaoManager get managers =>
      RegistroEnfermedadDaoManager(this);
}

class RegistroEnfermedadDaoManager {
  final _$RegistroEnfermedadDaoMixin _db;
  RegistroEnfermedadDaoManager(this._db);
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
}

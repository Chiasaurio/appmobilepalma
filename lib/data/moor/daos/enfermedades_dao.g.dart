// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enfermedades_dao.dart';

// ignore_for_file: type=lint
mixin _$EnfermedadesDaoMixin on DatabaseAccessor<AppDatabase> {
  $EnfermedadesTable get enfermedades => attachedDatabase.enfermedades;
  $EtapasTable get etapas => attachedDatabase.etapas;
  EnfermedadesDaoManager get managers => EnfermedadesDaoManager(this);
}

class EnfermedadesDaoManager {
  final _$EnfermedadesDaoMixin _db;
  EnfermedadesDaoManager(this._db);
  $$EnfermedadesTableTableManager get enfermedades =>
      $$EnfermedadesTableTableManager(_db.attachedDatabase, _db.enfermedades);
  $$EtapasTableTableManager get etapas =>
      $$EtapasTableTableManager(_db.attachedDatabase, _db.etapas);
}

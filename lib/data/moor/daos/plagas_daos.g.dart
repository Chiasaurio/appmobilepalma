// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plagas_daos.dart';

// ignore_for_file: type=lint
mixin _$PlagasDaoMixin on DatabaseAccessor<AppDatabase> {
  $PlagasTable get plagas => attachedDatabase.plagas;
  $EtapasPlagaTable get etapasPlaga => attachedDatabase.etapasPlaga;
  $CensoTable get censo => attachedDatabase.censo;
  $CensoEtapasPlagaTable get censoEtapasPlaga =>
      attachedDatabase.censoEtapasPlaga;
  $ImagenCensoPlagaTable get imagenCensoPlaga =>
      attachedDatabase.imagenCensoPlaga;
  Selectable<CensoData> getIdCenso() {
    return customSelect('SELECT * FROM censo ORDER BY id_censo DESC LIMIT 1',
        variables: [],
        readsFrom: {
          censo,
        }).asyncMap(censo.mapFromRow);
  }
}

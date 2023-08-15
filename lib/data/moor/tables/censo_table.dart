import 'package:drift/drift.dart';

import '../moor_database.dart';

class Censo extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idCenso => integer().nullable()();
  DateTimeColumn get fechaCenso => dateTime()();
  TextColumn get identificador => text()();
  TextColumn get observacionCenso => text().nullable()();
  TextColumn get nombreLote => text()();
  IntColumn get numeroIndividuos => integer().nullable()();
  TextColumn get nombrePlaga => text()();
  TextColumn get estadoPlaga =>
      text().withDefault(const Constant('Pendiente por fumigar'))();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
  TextColumn get responsable => text()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
}

class CensoEtapasPlaga extends Table {
  IntColumn get idCensoEtapasplaga => integer().autoIncrement()();
  IntColumn get idCenso => integer()();
  IntColumn get idEtapasplaga => integer()();
  IntColumn get numeroIndividuos => integer()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(id_censo) REFERENCES censo(id)',
        'FOREIGN KEY(id_etapasplaga) REFERENCES etapas_plaga(id_etapasplaga)',
      ];
}

class ImagenCensoPlaga extends Table {
  IntColumn get idImagenCensoPlaga => integer().autoIncrement()();
  IntColumn get idCenso => integer()();
  BlobColumn get imagen => blob()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(id_censo) REFERENCES censo(id)',
      ];
}

class CensoConEtapas {
  final CensoData censo;
  final List<CensoEtapasPlagaData> etapas;
  final List<ImagenCensoPlagaData> imagenes;

  CensoConEtapas({
    required this.censo,
    required this.etapas,
    required this.imagenes,
  });
}

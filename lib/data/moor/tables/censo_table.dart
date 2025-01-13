import 'package:drift/drift.dart';

import '../moor_database.dart';
import 'plagas_table.dart';

class Censo extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idCenso => integer().nullable()();
  DateTimeColumn get fechaCenso => dateTime()();
  TextColumn get observacionCenso => text().nullable()();
  TextColumn get nombreLote => text()();
  IntColumn get numeroIndividuos => integer().nullable()();
  TextColumn get nombrePlaga => text()();
  TextColumn get estadoPlaga =>
      text().withDefault(const Constant('Pendiente por fumigar'))();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
  TextColumn get responsable => text()();
  IntColumn get numerolinea => integer()();
  IntColumn get numeroenlinea => integer()();
  TextColumn get orientacion => text()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {idCenso},
      ];
}

class CensoEtapasPlaga extends Table {
  IntColumn get idCensoEtapasplaga => integer().autoIncrement()();
  IntColumn get idCenso => integer().references(Censo, #id)();
  IntColumn get idEtapasplaga =>
      integer().references(EtapasPlaga, #idEtapasPlaga)();
  IntColumn get numeroIndividuos => integer()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
}

class ImagenCensoPlaga extends Table {
  IntColumn get idImagenCensoPlaga => integer().autoIncrement()();
  IntColumn get idCenso => integer().references(Censo, #id)();
  BlobColumn get imagen => blob()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
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

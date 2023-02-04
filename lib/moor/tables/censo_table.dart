import 'package:drift/drift.dart';

class Censo extends Table {
  IntColumn get idCenso => integer().autoIncrement()();
  DateTimeColumn get fechaCenso => dateTime()();
  BoolColumn get presenciaLote =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get presenciaSector =>
      boolean().withDefault(const Constant(true))();
  IntColumn get lineaLimite1 => integer()();
  IntColumn get lineaLimite2 => integer()();
  TextColumn get observacionCenso => text().nullable()();
  TextColumn get nombreLote => text()();
  TextColumn get nombrePlaga => text()();
  TextColumn get estadoPlaga =>
      text().withDefault(const Constant('pendiente'))();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
}

class CensoEtapasPlaga extends Table {
  IntColumn get idCensoEtapasplaga => integer().autoIncrement()();
  IntColumn get idCenso => integer()();
  IntColumn get idEtapasplaga => integer()();

  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(id_censo) REFERENCES censo(id_censo)',
        'FOREIGN KEY(id_etapasplaga) REFERENCES etapas_plaga(id_etapasplaga)',
      ];
}

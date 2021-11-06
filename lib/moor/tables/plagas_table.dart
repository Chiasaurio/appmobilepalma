import 'package:apppalma/moor/moor_database.dart';
import 'package:drift/drift.dart';

class Plagas extends Table {
  TextColumn get nombreComunPlaga => text()();

  Set<Column> get primaryKey => {nombreComunPlaga};
}

class EtapasPlaga extends Table {
  IntColumn get idEtapasPlaga => integer().autoIncrement()();
  TextColumn get nombrePlaga =>
      text().customConstraint('REFERENCES plagas(nombre_comun_plaga)')();
  TextColumn get nombreEtapa => text()();
  TextColumn get procedimientoEtapa => text()();
  // TextColumn get nombreLote => text()();
  // IntColumn get numerolinea => integer()();
  // IntColumn get numeroenlinea => integer()();
  @override
  List<String> get customConstraints => ['UNIQUE (nombre_plaga, nombre_etapa)'];
}

class PlagaConEtapas {
  final Plaga plaga;
  final List<EtapasPlagaData> etapas;

  PlagaConEtapas({
    required this.plaga,
    required this.etapas,
  });
}

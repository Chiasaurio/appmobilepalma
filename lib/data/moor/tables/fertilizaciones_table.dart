import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';

import 'fertilizante_table.dart';
import 'usuario_table.dart';

class Fertilizaciones extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idFertilizacion => integer().nullable()();
  TextColumn get nombreLote => text()();
  DateTimeColumn get fechaIngreso => dateTime()();
  DateTimeColumn get fechaSalida => dateTime().nullable()();
  IntColumn get cantidadFertilizada => integer()();
  BoolColumn get completado => boolean().withDefault(const Constant(false))();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
  @override
  List<String> get customConstraints => ['UNIQUE (id_fertilizacion)'];
}

class FertilizacionDiaria extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idFertilizacion =>
      integer().references(Fertilizaciones, #idFertilizacion)();
  DateTimeColumn get fecha => dateTime()();
  IntColumn get cantidadFertilizada => integer()();
  RealColumn get dosis => real()();
  TextColumn get unidades => text()();
  TextColumn get lineaInicio => text()();
  TextColumn get numeroInicio => text()();
  TextColumn get orientacionInicio => text()();
  TextColumn get lineaFin => text()();
  TextColumn get numeroFin => text()();
  TextColumn get orientacionFin => text()();
  TextColumn get responsable => text().references(Usuario, #ccUsuario)();
  TextColumn get nombreFertilizante =>
      text().references(Fertilizante, #nombreFertilizante)();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
}

class FertilizacionConFertilizacionesDiarias {
  final Fertilizacione fertilizacion;
  final List<FertilizacionDiariaData> fertilizacionesDiarias;

  FertilizacionConFertilizacionesDiarias({
    required this.fertilizacion,
    required this.fertilizacionesDiarias,
  });
}

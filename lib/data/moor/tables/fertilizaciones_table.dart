import 'package:drift/drift.dart';

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
      integer().customConstraint('NOT NULL REFERENCES fertilizaciones(id)')();
  DateTimeColumn get fecha => dateTime()();
  IntColumn get cantidadFertilizada => integer()();
  RealColumn get dosis => real()();
  TextColumn get unidades => text()();
  TextColumn get responsable => text()();
  IntColumn get idProductoAgroquimico => integer()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(id_fertilizacion) REFERENCES fertilizacion(id_fertilizacion)',
        'FOREIGN KEY(id_producto_agroquimico) REFERENCES producto_agroquimico(id_producto_agroquimico)',
        'FOREIGN KEY(responsable) REFERENCES usuario(cc_usuario)',
      ];
}

// class FertilizacionConFertilizacionesDiarias {
//   final Plateo plateo;
//   final List<PlateoDiarioData> plateosDiarias;

//   FertilizacionConFertilizacionesDiarias({
//     required this.plateo,
//     required this.plateosDiarias,
//   });
// }

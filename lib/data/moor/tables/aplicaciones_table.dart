import 'package:drift/drift.dart';

class Aplicaciones extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get dosis => real()();
  IntColumn get area => integer()();
  DateTimeColumn get fechaAplicacion => dateTime()();
  DateTimeColumn get fechaReingreso => dateTime()();
  TextColumn get ccUsuario => text()();
  IntColumn get idCenso => integer()();
  IntColumn get idProductoAgroquimico => integer()();
  TextColumn get responsable => text()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(id_censo) REFERENCES censo(id_censo)',
        'FOREIGN KEY(id_producto_agroquimico) REFERENCES producto_agroquimico(id_producto_agroquimico)',
      ];
}

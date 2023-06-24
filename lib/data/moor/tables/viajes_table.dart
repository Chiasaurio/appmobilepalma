import 'package:drift/drift.dart';

class Viajes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idViaje => integer().nullable()();
  DateTimeColumn get horaCargue => dateTime()();
  DateTimeColumn get horaSalida => dateTime().nullable()();
  IntColumn get cantidadRacimos => integer()();
  IntColumn get kilos => integer().nullable()();
  RealColumn get kilosExtractora => real().nullable()();
  BoolColumn get completado => boolean().withDefault(const Constant(false))();
  TextColumn get responsable => text()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
  // @override
  // Set<Column> get primaryKey => {id, nombreLote};
  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(responsable) REFERENCES usuario(cc_usuario)',
        'UNIQUE (id_viaje)'
      ];
}

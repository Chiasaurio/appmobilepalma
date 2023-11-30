import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';

class Podas extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idPoda => integer().nullable()();
  TextColumn get nombreLote => text()();
  DateTimeColumn get fechaIngreso => dateTime()();
  DateTimeColumn get fechaSalida => dateTime().nullable()();
  IntColumn get cantidadPodada => integer()();
  BoolColumn get completada => boolean().withDefault(const Constant(false))();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  List<String> get customConstraints => ['UNIQUE (id_poda)'];
}

class PodaDiaria extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idPoda =>
      integer().customConstraint('NOT NULL REFERENCES podas(id)')();
  DateTimeColumn get fechaIngreso => dateTime()();
  IntColumn get cantidadPodada => integer()();
  TextColumn get lineaInicio => text()();
  TextColumn get numeroInicio => text()();
  TextColumn get orientacionInicio => text()();
  TextColumn get lineaFin => text()();
  TextColumn get numeroFin => text()();
  TextColumn get orientacionFin => text()();
  TextColumn get responsable => text()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(responsable) REFERENCES usuario(cc_usuario)',
      ];
}

class PodasConPodasDiarias {
  final Poda poda;
  final List<PodaDiariaData> podasDiarias;

  PodasConPodasDiarias({
    required this.poda,
    required this.podasDiarias,
  });
}

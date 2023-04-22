import 'package:drift/drift.dart';

class Erradicacion extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get causaErradicacion => text().nullable()();
  TextColumn get idPalma => text()();
  TextColumn get observaciones => text().nullable()();
  DateTimeColumn get fechaRegistro => dateTime()();
  TextColumn get responsable => text()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(id_palma) REFERENCES palmas(identificador)',
        'FOREIGN KEY(responsable) REFERENCES usuario(cc_usuario)',
      ];
}

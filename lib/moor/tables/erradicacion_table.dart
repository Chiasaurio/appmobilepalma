import 'package:drift/drift.dart';

class Erradicacion extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idPalma => integer()();
  TextColumn get causaErradicacion => text().nullable()();
  DateTimeColumn get fechaRegistro => dateTime()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(id_palma) REFERENCES palmas(id)',
      ];
}

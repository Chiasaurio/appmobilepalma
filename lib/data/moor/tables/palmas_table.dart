import 'dart:convert';

import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';

class Palmas extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idPalma => integer().nullable()();
  TextColumn get nombreLote => text()();
  IntColumn get numerolinea => integer()();
  IntColumn get numeroenlinea => integer()();
  TextColumn get orientacion => text()();
  TextColumn get estadopalma => text()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  static String mapEntryToJson(Palma entry) {
    return json.encode(entry.toJson());
  }

  @override
  List<Set<Column>> get uniqueKeys => [
        {numerolinea, numeroenlinea, orientacion},
      ];
  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(nombre_lote) REFERENCES lotes(nombre_lote)',
      ];
}

class PalmaValidada {
  final Palma palma;
  final RegistroEnfermedadData? registroEnfermedad;
  final Enfermedade? enfermedad;
  final Etapa? etapa;

  PalmaValidada({
    required this.palma,
    this.registroEnfermedad,
    this.enfermedad,
    this.etapa,
  });
}

import 'dart:convert';

import 'package:apppalma/moor/moor_database.dart';
import 'package:drift/drift.dart';

class Palmas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombreLote => text()();
  IntColumn get numerolinea => integer()();
  IntColumn get numeroenlinea => integer()();
  TextColumn get estadopalma => text()();

  static String mapEntryToJson(Palma entry) {
    return json.encode(entry.toJson());
  }

  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(nombre_lote) REFERENCES lotes(nombre_lote)',
      ];
}

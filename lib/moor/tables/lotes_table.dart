import 'package:apppalma/moor/moor_database.dart';
import 'package:drift/drift.dart';

class Lotes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombreLote => text()();
  IntColumn get hectareas => integer()();
  IntColumn get numeropalmas => integer()();

  @override
  List<String> get customConstraints => ['UNIQUE (nombre_lote)'];
}

class LoteWithProcesos {
  final Lote lote;
  final Cosecha cosecha;
  final Plateo plateo;
  final Poda poda;

  LoteWithProcesos({
    required this.lote,
    required this.cosecha,
    required this.plateo,
    required this.poda,
  });
}

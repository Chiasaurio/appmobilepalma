import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';

class Lotes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombreLote => text()();
  IntColumn get hectareas => integer()();
  IntColumn get numeropalmas => integer()();
  DateTimeColumn get fechaUltimaActualizacion => dateTime().nullable()();

  @override
  List<String> get customConstraints => ['UNIQUE (nombre_lote)'];
}

class LoteWithProcesos extends Equatable {
  final Lote lote;
  final Cosecha? cosecha;
  final Plateo? plateo;
  final Poda? poda;
  final List<CensoData>? censospendientes;
  final List<Palma>? palmaspendientes;

  const LoteWithProcesos({
    required this.lote,
    this.cosecha,
    this.plateo,
    this.poda,
    this.censospendientes,
    this.palmaspendientes,
  });

  @override
  List<Object?> get props =>
      [lote, cosecha, plateo, poda, censospendientes, palmaspendientes];
}

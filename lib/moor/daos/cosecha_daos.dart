import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/cosechas_table.dart';
import 'package:drift/drift.dart';

part 'cosecha_daos.g.dart';

@DriftAccessor(tables: [Cosechas, CosechaDiaria])
class CosechaDao extends DatabaseAccessor<AppDatabase> with _$CosechaDaoMixin {
  final AppDatabase db;
  CosechaDao(this.db) : super(db);

  Stream<List<Cosecha>> watchCosechasFinalizadas() {
    return (select(cosechas)..where((tbl) => tbl.completada.equals(true)))
        .watch();
  }

  Future<List<Cosecha>> getCosechasFinalizadas() {
    return (select(cosechas)
          ..orderBy([
            (t) => OrderingTerm(
                expression: t.fechaSalida, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.nombreLote)
          ])
          ..where((tbl) => tbl.completada.equals(true)))
        .get();
  }

  Stream<Cosecha> watchCosechaActiva(String nombrelote) {
    return (select(cosechas)
          ..where((c) =>
              c.completada.equals(false) & c.nombreLote.equals(nombrelote)))
        .watchSingle();
  }

  Future<Cosecha> getCosechaActiva(String nombrelote) {
    return (select(cosechas)
          ..where((c) =>
              c.completada.equals(false) & c.nombreLote.equals(nombrelote)))
        .getSingle();
  }

  Future insertCosecha(Insertable<Cosecha> cosecha) =>
      into(cosechas).insert(cosecha);
  Future updateCosecha(Insertable<Cosecha> cosecha) =>
      update(cosechas).replace(cosecha);
  Future deleteCosecha(Insertable<Cosecha> cosecha) =>
      delete(cosechas).delete(cosecha);
}

@DriftAccessor(tables: [CosechaDiaria, Cosechas])
class CosechaDiariaDao extends DatabaseAccessor<AppDatabase>
    with _$CosechaDiariaDaoMixin {
  final AppDatabase db;
  CosechaDiariaDao(this.db) : super(db);

  //   Stream<List<CosechaDiariaWithCosecha>> watchAllCosechas() {
  //     return (select(cosechaDiaria)
  //         ..orderBy(
  //           ([
  //             (t) =>
  //                 OrderingTerm(expression: t.idCosecha, mode: OrderingMode.asc),
  //           ]),
  //         ))
  //       .join(
  //         [
  //           leftOuterJoin(cosechas, cosechas.id.equalsExp(cosechaDiaria.idCosecha)),
  //         ],
  //       )
  //       .watch()
  //       .map(
  //         (rows) => rows.map(
  //           (row) {
  //             return CosechaDiariaWithCosecha(
  //               cosecha: row.readTable(cosechas),
  //               cosechadiaria: row.readTable(cosechaDiaria),
  //             );
  //           },
  //         ).toList(),
  //       );

  // }

  Future<List<CosechaDiariaData>> getCosechasDiarias(int id) {
    return (select(cosechaDiaria)
          ..where((c) => c.idCosecha.equals(id))
          ..orderBy(
            ([
              (t) =>
                  OrderingTerm(expression: t.idCosecha, mode: OrderingMode.asc),
            ]),
          ))
        .get();
  }

  Stream<List<CosechaDiariaData>> watchCosechaDiaria() =>
      select(cosechaDiaria).watch();
  Future insertCosechaDiaria(Insertable<CosechaDiariaData> cosechadiaria) =>
      into(cosechaDiaria).insert(cosechadiaria);
}

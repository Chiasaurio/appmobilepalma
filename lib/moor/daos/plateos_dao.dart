import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/plateos_table.dart';
import 'package:drift/drift.dart';

part 'plateos_dao.g.dart';

@DriftAccessor(tables: [Plateos, PlateoDiario])
class PlateoDao extends DatabaseAccessor<AppDatabase> with _$PlateoDaoMixin {
  final AppDatabase db;
  PlateoDao(this.db) : super(db);

  Future<Plateo?> getPlateoActivo(String nombrelote) {
    return (select(plateos)
          ..where((c) =>
              c.completado.equals(false) & c.nombreLote.equals(nombrelote)))
        .getSingleOrNull();
  }

  Future insertPlateo(Insertable<Plateo> plateo) =>
      into(plateos).insert(plateo);
  Future updatePlateo(Insertable<Plateo> plateo) =>
      update(plateos).replace(plateo);
  Future deletePlateo(Insertable<Plateo> plateo) =>
      delete(plateos).delete(plateo);

  Future<List<PlateoDiarioData>> getPlateosDiarios(int id) {
    return (select(plateoDiario)
          ..where((c) => c.idPlateo.equals(id))
          ..orderBy(
            ([
              (t) =>
                  OrderingTerm(expression: t.idPlateo, mode: OrderingMode.asc),
            ]),
          ))
        .get();
  }

  Future insertPlateoDiario(Insertable<PlateoDiarioData> plateodiario) =>
      into(plateoDiario).insert(plateodiario);
}

// @UseDao(tables: [CosechaDiaria, Cosechas])
// class CosechaDiariaDao extends DatabaseAccessor<AppDatabase>
//     with _$CosechaDiariaDaoMixin {
//   final AppDatabase db;
//   CosechaDiariaDao(this.db) : super(db);

//   //   Stream<List<CosechaDiariaWithCosecha>> watchAllCosechas() {
//   //     return (select(cosechaDiaria)
//   //         ..orderBy(
//   //           ([
//   //             (t) =>
//   //                 OrderingTerm(expression: t.idCosecha, mode: OrderingMode.asc),
//   //           ]),
//   //         ))
//   //       .join(
//   //         [
//   //           leftOuterJoin(cosechas, cosechas.id.equalsExp(cosechaDiaria.idCosecha)),
//   //         ],
//   //       )
//   //       .watch()
//   //       .map(
//   //         (rows) => rows.map(
//   //           (row) {
//   //             return CosechaDiariaWithCosecha(
//   //               cosecha: row.readTable(cosechas),
//   //               cosechadiaria: row.readTable(cosechaDiaria),
//   //             );
//   //           },
//   //         ).toList(),
//   //       );

//   // }

//   Stream<List<CosechaDiariaData>> watchCosechaDiaria() =>
//       select(cosechaDiaria).watch();

// }

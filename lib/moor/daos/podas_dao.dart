import 'package:apppalma/moor/moor_database.dart';
import 'package:drift/drift.dart';

import 'package:apppalma/moor/tables/podas_table.dart';

part 'podas_dao.g.dart';

@DriftAccessor(tables: [Podas, PodaDiaria])
class PodaDao extends DatabaseAccessor<AppDatabase> with _$PodaDaoMixin {
  final AppDatabase db;
  PodaDao(this.db) : super(db);

  Future<Poda> getPodaActiva(String nombrelote) {
    return (select(podas)
          ..where((c) =>
              c.completada.equals(false) & c.nombreLote.equals(nombrelote)))
        .getSingle();
  }

  Future insertPoda(Insertable<Poda> poda) => into(podas).insert(poda);
  Future updatePoda(Insertable<Poda> poda) => update(podas).replace(poda);
  Future deletePoda(Insertable<Poda> poda) => delete(podas).delete(poda);

  Future<List<PodaDiariaData>> getPodasDiarias(int id) {
    return (select(podaDiaria)
          ..where((c) => c.idPoda.equals(id))
          ..orderBy(
            ([
              (t) => OrderingTerm(expression: t.idPoda, mode: OrderingMode.asc),
            ]),
          ))
        .get();
  }

  Future insertPodaDiaria(Insertable<PodaDiariaData> podadiaria) =>
      into(podaDiaria).insert(podadiaria);

  Future<List<Poda>> getPodasFinalizadas() {
    return (select(podas)
          ..orderBy([
            (t) => OrderingTerm(
                expression: t.fechaSalida, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.nombreLote)
          ])
          ..where((tbl) => tbl.completada.equals(true)))
        .get();
  }
}

// Stream<Cosecha> watchCosechaActiva(String nombrelote) {
//   return (select(cosechas)
//         ..where((c) =>
//             c.completada.equals(false) & c.nombreLote.equals(nombrelote)))
//       .watchSingle();
// }

// Future<Cosecha> getCosechaActiva(String nombrelote) {
//   return (select(cosechas)
//         ..where((c) =>
//             c.completada.equals(false) & c.nombreLote.equals(nombrelote)))
//       .getSingle();
// }

// Future insertCosecha(Insertable<Cosecha> cosecha) =>
//     into(cosechas).insert(cosecha);
// Future updateCosecha(Insertable<Cosecha> cosecha) =>
//     update(cosechas).replace(cosecha);
// Future deleteCosecha(Insertable<Cosecha> cosecha) =>
//     delete(cosechas).delete(cosecha);

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

//   Future<List<CosechaDiariaData>> getCosechasDiarias(int id) {
//     return (select(cosechaDiaria)
//           ..where((c) => c.idCosecha.equals(id))
//           ..orderBy(
//             ([
//               (t) =>
//                   OrderingTerm(expression: t.idCosecha, mode: OrderingMode.asc),
//             ]),
//           ))
//         .get();
//   }

//   Stream<List<CosechaDiariaData>> watchCosechaDiaria() =>
//       select(cosechaDiaria).watch();
//   Future insertCosechaDiaria(Insertable<CosechaDiariaData> cosechadiaria) =>
//       into(cosechaDiaria).insert(cosechadiaria);
// }

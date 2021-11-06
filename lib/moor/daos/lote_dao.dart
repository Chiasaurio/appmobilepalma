import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/cosechas_table.dart';
import 'package:apppalma/moor/tables/lotes_table.dart';
import 'package:apppalma/moor/tables/plateos_table.dart';
import 'package:apppalma/moor/tables/podas_table.dart';
import 'package:drift/drift.dart';

part 'lote_dao.g.dart';

@DriftAccessor(tables: [Lotes, Cosechas, Plateos, Podas])
class LoteDao extends DatabaseAccessor<AppDatabase> with _$LoteDaoMixin {
  LoteDao(AppDatabase db) : super(db);

  // Future insertarEnfermedad( Insertable<RegistroEnfermedadData> registroenfermedad) => into(registroEnfermedad).insert(registroenfermedad);
  Future<List<Lote>> getLotes() {
    return (select(lotes)
          ..orderBy([(t) => OrderingTerm(expression: t.nombreLote)]))
        .get();
  }

  Future<int> addLote(LotesCompanion lote) {
    return into(lotes).insert(lote);
  }

  addLotes(List<Insertable<Lote>> listalotes) async {
    try {
      await batch((b) {
        for (final lote in listalotes) {
          b.insert(
            lotes,
            lote,
            onConflict: DoUpdate(
              (_) => lote,
              // upsert will happen if it conflicts with columnA and columnB
              target: [lotes.nombreLote],
            ),
          );
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List<LoteWithProcesos>> getLotesWithProcesos() async {
    final rows = await (select(lotes)
          ..orderBy(
            ([
              (t) => OrderingTerm(expression: t.id, mode: OrderingMode.asc),
            ]),
          ))
        .join(
      [
        leftOuterJoin(
            cosechas,
            cosechas.nombreLote.equalsExp(lotes.nombreLote) &
                cosechas.completada.equals(false)),
        leftOuterJoin(
            plateos,
            plateos.nombreLote.equalsExp(lotes.nombreLote) &
                plateos.completado.equals(false)),
        leftOuterJoin(
            podas,
            podas.nombreLote.equalsExp(lotes.nombreLote) &
                podas.completada.equals(false)),
      ],
    ).get();

    return rows.map((resultRow) {
      return LoteWithProcesos(
          lote: resultRow.readTable(lotes),
          cosecha: resultRow.readTable(cosechas),
          plateo: resultRow.readTable(plateos),
          poda: resultRow.readTable(podas));
    }).toList();
  }
}

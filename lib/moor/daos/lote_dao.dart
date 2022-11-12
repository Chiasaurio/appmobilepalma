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
    return (select(lotes)).get();
  }

  Future<int> addLote(LotesCompanion lote) {
    return into(lotes).insert(lote);
  }

  Future<bool> addLotes(List<Insertable<Lote>> listalotes) async {
    try {
      await batch((b) {
        b.insertAllOnConflictUpdate(lotes, listalotes);
        // for (final lote in listalotes) {
        //   b.insert(
        //     lotes,
        //     lote,
        //     onConflict: DoUpdate(
        //       (_) => lote,
        //       // upsert will happen if it conflicts with columnA and columnB
        //       target: [lotes.nombreLote],
        //     ),
        //   );
        // }
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<LoteWithProcesos> getSingleLote(int id) async {
    final lote = await (select(lotes)..where((c) => c.id.equals(id))).join(
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
      // ).get();
    ).getSingleOrNull();
    // return lote!.readTable(lotes);
    return LoteWithProcesos(
        lote: lote!.readTable(lotes),
        cosecha: lote.readTableOrNull(cosechas),
        plateo: lote.readTableOrNull(plateos),
        poda: lote.readTableOrNull(podas));
  }

  Future<List<LoteWithProcesos>> getLotesWithProcesos() async {
    final rows = await (select(lotes)).join(
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
          cosecha: resultRow.readTableOrNull(cosechas),
          plateo: resultRow.readTableOrNull(plateos),
          poda: resultRow.readTableOrNull(podas));
    }).toList();
  }
}

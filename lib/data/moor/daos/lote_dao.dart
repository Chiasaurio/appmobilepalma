import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/data/moor/tables/precipitacion.dart';
import 'package:apppalma/presentation/components/toasts/toasts.dart';
import 'package:drift/drift.dart';

import '../tables/tables.dart';

part 'lote_dao.g.dart';

@DriftAccessor(
    tables: [Lotes, Cosechas, Plateos, Podas, Censo, Palmas, Precipitacion])
class LoteDao extends DatabaseAccessor<AppDatabase> with _$LoteDaoMixin {
  LoteDao(AppDatabase db) : super(db);

  Future<List<Lote>> getLotes() {
    return (select(lotes)).get();
  }

  Future<int> addLote(LotesCompanion lote) {
    return into(lotes).insert(lote);
  }

  Future<int> agregarPrecipitacion(PrecipitacionCompanion p) {
    return into(precipitacion).insert(p);
  }

  Future<bool> addLotes(List<Insertable<Lote>> listalotes) async {
    try {
      await batch((b) {
        b.insertAllOnConflictUpdate(lotes, listalotes);
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Lote?> getLoteUltimo() async {
    final query = (select(lotes));
    query.orderBy([(tbl) => OrderingTerm.desc(tbl.fechaUltimaActualizacion)]);

    final res = await query.get();

    return res[0];
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
    ).getSingleOrNull();
    final censosrows = (select(lotes)..where((c) => c.id.equals(id)))
        .join(
          [
            leftOuterJoin(
                censo,
                censo.nombreLote.equalsExp(lotes.nombreLote) &
                    censo.estadoPlaga.equals('pendiente')),
          ],
        )
        .watch()
        .map((rows) {
          final groupedData = <CensoData>[];
          for (final row in rows) {
            final censoresult = row.readTableOrNull(censo);
            if (censoresult != null) groupedData.add(censoresult);
          }
          return groupedData;
        });
    final censos = await censosrows.first;
    final palmasrows = (select(lotes)..where((c) => c.id.equals(id)))
        .join(
          [
            leftOuterJoin(
                palmas,
                palmas.nombreLote.equalsExp(lotes.nombreLote) &
                    palmas.estadopalma.equals('Pendiente por tratar')),
          ],
        )
        .watch()
        .map((rows) {
          final groupedData = <Palma>[];
          for (final row in rows) {
            final palmaresult = row.readTableOrNull(palmas);
            if (palmaresult != null) groupedData.add(palmaresult);
          }
          return groupedData;
        });
    final palmasresult = await palmasrows.first;
    // final lotecensos =
    //     await (select(lotes)..where((c) => c.id.equals(id))).join([
    //   leftOuterJoin(
    //       censo,
    //       censo.nombreLote.equalsExp(lotes.nombreLote) &
    //           censo.estadoPlaga.equals('pendiente')),
    // leftOuterJoin(
    //     palmas,
    //     palmas.nombreLote.equalsExp(lotes.nombreLote) &
    //         palmas.estadopalma.equals('Pendiente por tratar')),
    // ]);

    return LoteWithProcesos(
        lote: lote!.readTable(lotes),
        censospendientes: censos,
        palmaspendientes: palmasresult,
        cosecha: lote.readTableOrNull(cosechas),
        plateo: lote.readTableOrNull(plateos),
        poda: lote.readTableOrNull(podas));
  }

  Future<List<LoteWithProcesos>> getLotesWithProcesos() async {
    try {
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
    } catch (e) {
      registroFallidoToast('Error obteniendo lotes $e');
      return [];
    }
  }
}

import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/presentation/components/toasts/toasts.dart';
import 'package:drift/drift.dart';

import '../tables/tables.dart';

part 'lote_dao.g.dart';

@DriftAccessor(tables: [
  Lotes,
  Cosechas,
  Plateos,
  Podas,
  Censo,
  Palmas,
  Precipitacion,
  Fertilizaciones
])
class LoteDao extends DatabaseAccessor<AppDatabase> with _$LoteDaoMixin {
  LoteDao(AppDatabase db) : super(db);

  Future<List<Lote>> getLotes() {
    return (select(lotes)).get();
  }

  Future<List<PrecipitacionData>> getPrecipitacionesPendientesForSync() {
    return (select(precipitacion)..where((c) => c.sincronizado.equals(false)))
        .get();
  }

  Future updatePrecipitacion(PrecipitacionData p) =>
      update(precipitacion).replace(p.copyWith(sincronizado: false));

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
        leftOuterJoin(
            fertilizaciones,
            fertilizaciones.nombreLote.equalsExp(lotes.nombreLote) &
                fertilizaciones.completado.equals(false)),
      ],
    ).getSingleOrNull();
    final censosrows = (select(lotes)..where((c) => c.id.equals(id)))
        .join(
          [
            leftOuterJoin(
                censo,
                censo.nombreLote.equalsExp(lotes.nombreLote) &
                    censo.estadoPlaga.equals("Pendiente por fumigar")),
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
                    // palmas.sincronizado.equals(false))
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

    return LoteWithProcesos(
        lote: lote!.readTable(lotes),
        censospendientes: censos,
        palmaspendientes: palmasresult,
        cosecha: lote.readTableOrNull(cosechas),
        plateo: lote.readTableOrNull(plateos),
        poda: lote.readTableOrNull(podas),
        fertilizacion: lote.readTableOrNull(fertilizaciones));
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
          leftOuterJoin(
              fertilizaciones,
              fertilizaciones.nombreLote.equalsExp(lotes.nombreLote) &
                  fertilizaciones.completado.equals(false)),
        ],
      ).get();
      List<LoteWithProcesos> resultado = [];
      for (var resultRow in rows) {
        final censosrows = (select(lotes)
              ..where((c) => c.id.equals(resultRow.readTable(lotes).id)))
            .join(
              [
                leftOuterJoin(
                    censo,
                    censo.nombreLote.equalsExp(lotes.nombreLote) &
                        censo.estadoPlaga.equals("Pendiente por fumigar")),
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
        final palmasrows = (select(lotes)
              ..where((c) => c.id.equals(resultRow.readTable(lotes).id)))
            .join(
              [
                leftOuterJoin(
                    palmas,
                    palmas.nombreLote.equalsExp(lotes.nombreLote) &
                        // palmas.sincronizado.equals(false))
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
        resultado.add(LoteWithProcesos(
            lote: resultRow.readTable(lotes),
            censospendientes: censos,
            palmaspendientes: palmasresult,
            cosecha: resultRow.readTableOrNull(cosechas),
            plateo: resultRow.readTableOrNull(plateos),
            poda: resultRow.readTableOrNull(podas),
            fertilizacion: resultRow.readTableOrNull(fertilizaciones)));
      }

      return resultado;
    } catch (e) {
      registroFallidoToast('Error obteniendo lotes $e');
      return [];
    }
  }
}

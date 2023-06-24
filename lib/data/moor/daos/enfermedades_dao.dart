import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/data/moor/tables/enfermedades_table.dart';
import 'package:drift/drift.dart';

part 'enfermedades_dao.g.dart';

@DriftAccessor(tables: [Enfermedades, Etapas])
class EnfermedadesDao extends DatabaseAccessor<AppDatabase>
    with _$EnfermedadesDaoMixin {
  EnfermedadesDao(AppDatabase db) : super(db);

  Future<List<Enfermedade>> getEnfermedades() {
    return (select(enfermedades)).get();
  }

  Future insertEnfermedad(Insertable<Enfermedade> enfermedad) =>
      into(enfermedades).insert(enfermedad);

  Future insertEtapa(Insertable<Etapa> etapa) => into(etapas).insert(etapa);

  Future insertEnfermedadConEtapas(
      Insertable<Enfermedade> enfermedad, List<Insertable<Etapa>> listaetapas) {
    return transaction(() async {
      await into(enfermedades).insert(enfermedad);
      for (var element in listaetapas) {
        await into(etapas).insert(element);
      }
    });
  }

  Future<void> addEnfermedades(List<Insertable<Enfermedade>> listaenfermedades,
      List<Insertable<Etapa>> listaetapas) async {
    try {
      await batch((b) {
        b.insertAllOnConflictUpdate(enfermedades, listaenfermedades);
      });
      await batch((b) {
        b.insertAllOnConflictUpdate(etapas, listaetapas);
      });
    } catch (_) {}
  }

  Future<Enfermedade?> getEnfermedadesUltimo() async {
    final query = (select(enfermedades));
    query.orderBy([(tbl) => OrderingTerm.desc(tbl.fechaUltimaActualizacion)]);

    final res = await query.get();

    return res[0];
  }

  Future<List<EnfermedadConEtapas>> obtenerEnfermedadConEtapas() async {
    final rows = (select(enfermedades))
        .join(
          [
            leftOuterJoin(
                etapas,
                etapas.nombreEnfermedad
                    .equalsExp(enfermedades.nombreEnfermedad)),
          ],
        )
        .watch()
        .map((rows) {
          final groupedData = <Enfermedade, List<Etapa>>{};
          for (final row in rows) {
            final enfermedad = row.readTable(enfermedades);
            final etapa = row.readTableOrNull(etapas);
            final list = groupedData.putIfAbsent(enfermedad, () => []);
            if (etapa != null) list.add(etapa);
          }
          return [
            for (final entry in groupedData.entries)
              EnfermedadConEtapas(enfermedad: entry.key, etapas: entry.value)
          ];
        });
    final resp = await rows.first;
    return resp;
  }

  Future<Enfermedade> obtenerEnfermedad(String nombreEnfermedad) {
    return (select(enfermedades)
          ..where((c) => c.nombreEnfermedad.equals(nombreEnfermedad)))
        .getSingle();
  }

  Future<Etapa?> obtenerEtapa(int etapaId) {
    return (select(etapas)..where((c) => c.id.equals(etapaId)))
        .getSingleOrNull();
  }
}

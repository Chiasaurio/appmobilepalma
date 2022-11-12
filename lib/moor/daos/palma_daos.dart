import 'package:apppalma/moor/daos/enfermedades_dao.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/enfermedades_table.dart';
import 'package:apppalma/moor/tables/palmas_table.dart';
import 'package:apppalma/moor/tables/registroenfermedad_table.dart';
import 'package:apppalma/moor/tables/registrotratamiento_table.dart';
import 'package:drift/drift.dart';

part 'palma_daos.g.dart';

@DriftAccessor(tables: [
  Palmas,
  RegistroEnfermedad,
  RegistroTratamiento,
  Enfermedades,
  Etapas
])
class PalmaDao extends DatabaseAccessor<AppDatabase> with _$PalmaDaoMixin {
  final AppDatabase db;
  PalmaDao(this.db) : super(db);

  Future<List<Palma>> obtenerPalmas(String nombrelote) {
    return (select(palmas)..where((tbl) => tbl.nombreLote.equals(nombrelote)))
        .get();
  }

  Future<List<Palma>> obtenerTodasPalmas() {
    return (select(palmas)).get();
  }

  Future<List<RegistroEnfermedadData>> obtenerSoloRegistrosEnfermedad(
      int idPalma) {
    return (select(registroEnfermedad)..where((c) => c.idPalma.equals(idPalma)))
        .get();
  }

  Future<List<RegistroEnfermedadData>> obtenerRegistrosEnfermedad() {
    return (select(registroEnfermedad)).get();
  }

  Future<List<RegistroTratamientoData>> obtenerRegistrosTratamiento() {
    return (select(registroTratamiento)).get();
  }

  Future<List<EnfermedadConTratamiento>>
      obtenerEnfermedadesyTratamientos() async {
    final rows = await (select(registroEnfermedad)).join(
      [
        leftOuterJoin(
            registroTratamiento,
            registroTratamiento.idRegistroEnfermedad
                .equalsExp(registroEnfermedad.id)),
      ],
    ).get();

    return rows.map((resultRow) {
      return EnfermedadConTratamiento(
        enfermedad: resultRow.readTable(registroEnfermedad),
        tratamiento: resultRow.readTable(registroTratamiento),
      );
    }).toList();
  }

  Future<Palma?> obtenerPalma(
      String nombrelote, int numerolinea, int numeroenlinea) {
    return (select(palmas)
          ..where((c) =>
              c.nombreLote.equals(nombrelote) &
              c.numerolinea.equals(numerolinea) &
              c.numeroenlinea.equals(numeroenlinea)))
        .getSingleOrNull();
  }

  Future<int> getPalmaId(Insertable<Palma> palma) async {
    Map map = palma.toColumns(true);
    print(map);
    return 0;
  }

  Future insertPalma(Insertable<Palma> palma) => into(palmas).insert(palma);
  Future updatePalma(Insertable<Palma> palma) => update(palmas).replace(palma);
  Future deletePalma(Insertable<Palma> palma) => delete(palmas).delete(palma);

  Future insertarPalmaConEnfermedad(
      String nombrelote,
      int numerolinea,
      int numeroenlinea,
      DateTime fecha,
      String nombreEnfermedad,
      int? idEtapa,
      String tratamiento,
      String observaciones) async {
    try {
      String estadoPalma;
      if (tratamiento == 'Erradicación') {
        estadoPalma = 'Pendiente por erradicar';
      } else {
        estadoPalma = 'Pendiente por tratar';
      }
      final palma = await obtenerPalma(nombrelote, numerolinea, numeroenlinea);
      if (palma != null) {
        final registro = await obtenerSoloRegistrosEnfermedad(palma.id);
        if (registro != null) {
          estadoPalma = 'Reincidente';
        }
      }
      return transaction(() async {
        int idPalma;
        if (palma == null) {
          final nuevaPalma = PalmasCompanion(
              nombreLote: Value(nombrelote),
              numerolinea: Value(numerolinea),
              numeroenlinea: Value(numeroenlinea),
              estadopalma: Value(estadoPalma));
          final resp = await insertPalma(nuevaPalma);

          idPalma = resp;
        } else {
          idPalma = palma.id;
        }
        final registroenfermedad = RegistroEnfermedadCompanion(
            fechaRegistro: Value(fecha),
            horaRegistro: Value(fecha),
            idPalma: Value(idPalma),
            nombreEnfermedad: Value(nombreEnfermedad),
            idEtapaEnfermedad: Value(idEtapa),
            observaciones: Value(observaciones));
        await insertarEnfermedad(registroenfermedad);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List<PalmaConEnfermedad>> obtenerPalmasConEnfermedad(
      String nombrelote) async {
    final rows = await (select(palmas)
          ..where((tbl) =>
              tbl.nombreLote.equals(nombrelote) &
              tbl.estadopalma.equals('Pendiente por tratar')))
        .join(
      [
        leftOuterJoin(registroEnfermedad,
            registroEnfermedad.idPalma.equalsExp(palmas.id)),
      ],
    ).get();
    List<PalmaConEnfermedad> result = [];
    for (var resultRow in rows) {
      final nombreEnfermedad =
          resultRow.readTable(registroEnfermedad).nombreEnfermedad;
      final idEtapa = resultRow.readTable(registroEnfermedad).idEtapaEnfermedad;
      final enfermedad = await obtenerEnfermedad(nombreEnfermedad);
      final etapa = await obtenerEtapa(idEtapa);
      var palma = PalmaConEnfermedad(
          palma: resultRow.readTable(palmas),
          registroEnfermedad: resultRow.readTable(registroEnfermedad),
          enfermedad: enfermedad,
          etapa: etapa);
      result.add(palma);
    }

    return result;
  }

  Future<Enfermedade> obtenerEnfermedad(String nombreEnfermedad) {
    return (select(enfermedades)
          ..where((c) => c.nombreEnfermedad.equals(nombreEnfermedad)))
        .getSingle();
  }

  Future<Etapa?> obtenerEtapa(int? etapaId) {
    return (select(etapas)..where((c) => c.id.equals(etapaId!)))
        .getSingleOrNull();
  }

  Future insertarEnfermedad(
      Insertable<RegistroEnfermedadData> registroenfermedad) async {
    return await into(registroEnfermedad).insert(registroenfermedad);
  }

  Future<RegistroEnfermedadData> obtenerRegistroEnfermedad(Palma palma) {
    return (select(registroEnfermedad)
          ..where((c) => c.idPalma.equals(palma.id)))
        .getSingle();
  }

  Future<bool> insertarTratamiento(
      Insertable<RegistroTratamientoData> registrotratamiento) async {
    try {
      await into(registroTratamiento).insert(registrotratamiento);
    } catch (_) {
      return false;
    }
    return true;
  }

  Future<RegistroTratamientoData?> obtenerTratamiento(
      RegistroEnfermedadData registroenfermedad) {
    return (select(registroTratamiento)
          ..where((c) => c.idRegistroEnfermedad.equals(registroenfermedad.id)))
        .getSingleOrNull();
  }
}

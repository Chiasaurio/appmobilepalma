import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';

import '../tables/tables.dart';

part 'palma_daos.g.dart';

@DriftAccessor(tables: [
  Palmas,
  RegistroEnfermedad,
  ImagenRegistroEnfermedad,
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
      String idPalma) {
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

  Future<PalmaValidada?> obtenerPalmaConRegistros(
      String nombrelote, int numerolinea, int numeroenlinea) async {
    final resultRow = await (select(palmas)
          ..where((c) =>
              c.nombreLote.equals(nombrelote) &
              c.numerolinea.equals(numerolinea) &
              c.numeroenlinea.equals(numeroenlinea)))
        .join(
      [
        leftOuterJoin(registroEnfermedad,
            registroEnfermedad.idPalma.equalsExp(palmas.identificador)),
      ],
    ).getSingleOrNull();
    if (resultRow != null) {
      // for (var resultRow in rows) {
      final nombreEnfermedad =
          resultRow.readTableOrNull(registroEnfermedad)?.nombreEnfermedad;
      final idEtapa =
          resultRow.readTableOrNull(registroEnfermedad)?.idEtapaEnfermedad;
      Enfermedade? enfermedad;
      if (nombreEnfermedad != null) {
        enfermedad = await obtenerEnfermedad(nombreEnfermedad);
      }
      Etapa? etapa;
      if (idEtapa != null) {
        etapa = await obtenerEtapa(idEtapa);
      }
      var palma = PalmaValidada(
          palma: resultRow.readTable(palmas),
          registroEnfermedad: resultRow.readTableOrNull(registroEnfermedad),
          enfermedad: enfermedad,
          etapa: etapa);
      return palma;
    }
    return null;
  }

  Future insertPalma(Insertable<Palma> palma) => into(palmas).insert(palma);
  Future insertPalmaOrUpdate(Insertable<Palma> palma) =>
      into(palmas).insertOnConflictUpdate(
        palma,
      );

  Future updateSyncPalmas(Palma palma) {
    return (update(palmas)
          ..where((t) => t.identificador.equals(palma.identificador)))
        .write(
      const PalmasCompanion(
        sincronizado: Value(true),
      ),
    );
  }

  Future updatePalma(Insertable<Palma> palma) => update(palmas).replace(palma);
  Future deletePalma(Insertable<Palma> palma) => delete(palmas).delete(palma);

  Future<List<PalmaConEnfermedad>> obtenerPalmasConEnfermedad(
      String nombrelote) async {
    final rows = await (select(palmas)
          ..where((tbl) =>
              tbl.nombreLote.equals(nombrelote) &
              tbl.estadopalma.equals('Pendiente por tratar')))
        .join(
      [
        leftOuterJoin(registroEnfermedad,
            registroEnfermedad.idPalma.equalsExp(palmas.identificador)),
      ],
    ).get();
    List<PalmaConEnfermedad> result = [];
    Etapa? etapa;
    for (var resultRow in rows) {
      final nombreEnfermedad =
          resultRow.readTableOrNull(registroEnfermedad)?.nombreEnfermedad;
      final idEtapa =
          resultRow.readTableOrNull(registroEnfermedad)?.idEtapaEnfermedad;
      Enfermedade enfermedad;
      if (nombreEnfermedad! == 'Otra') {
        enfermedad = Enfermedade(
            nombreEnfermedad: nombreEnfermedad,
            procedimientoEnfermedad:
                resultRow.readTableOrNull(registroEnfermedad)?.observaciones ??
                    "");
      } else {
        enfermedad = await obtenerEnfermedad(nombreEnfermedad);
      }
      if (idEtapa != null) {
        etapa = await obtenerEtapa(idEtapa);
      }
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

  Future<Etapa?> obtenerEtapa(int etapaId) {
    return (select(etapas)..where((c) => c.id.equals(etapaId)))
        .getSingleOrNull();
  }

  Future insertarEnfermedad(
      Insertable<RegistroEnfermedadData> registroenfermedad) async {
    return await into(registroEnfermedad).insert(registroenfermedad);
  }

  Future<List<RegistroEnfermedadData>> obtenerRegistroEnfermedad(Palma palma) {
    return (select(registroEnfermedad)
          ..where((c) => c.idPalma.equals(palma.identificador)))
        .get();
  }

  Future<List<ImagenRegistroEnfermedadData>> obtenerImagenesRegistroEnfermedad(
      RegistroEnfermedadData registro) {
    return (select(imagenRegistroEnfermedad)
          ..where((i) => i.idEnfermedad.equals(registro.id)))
        .get();
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

  Future updateSyncTratamientos(RegistroTratamientoData tratamiento) {
    return (update(registroTratamiento)
          ..where((t) => t.id.equals(tratamiento.id)))
        .write(
      const RegistroTratamientoCompanion(
        sincronizado: Value(true),
      ),
    );
  }

  Future<List<Palma>> getPalmasForSync() {
    return (select(palmas)..where((c) => c.sincronizado.equals(false))).get();
  }

  Future<List<RegistroEnfermedadData>> getRegistrosEnfermedadesForSync() {
    return (select(registroEnfermedad)
          ..where((c) => c.sincronizado.equals(false)))
        .get();
  }

  Future<List<ImagenRegistroEnfermedadData>> getImagenesEnfermedadesForSync(
      RegistroEnfermedadData registro) {
    return (select(imagenRegistroEnfermedad)
          ..where((i) => i.idEnfermedad.equals(registro.id)))
        .get();
  }

  Future<List<RegistroTratamientoData>> getRegistrosTratamientosForSync() {
    return (select(registroTratamiento)
          ..where((c) => c.sincronizado.equals(false)))
        .get();
  }
}

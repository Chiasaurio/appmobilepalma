import 'package:apppalma/main.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/moor/daos/daos.dart';
import '../../../../data/moor/moor_database.dart';
import '../../../../globals.dart' as globals;

part 'censo_productivo_state.dart';

class CensoProductivoCubit extends Cubit<CensoProductivoInitial> {
  CensoProductivoCubit() : super(const CensoProductivoInitial());

  final db = getIt<AppDatabase>();

  Future<bool> registrarCensoProductivo({
    required DateTime fechaCenso,
    required String nombreLote,
    int? floresFemeninas,
    int? floresMasculinas,
    int? palmasLeidas,
    int? racimosVerdes,
    int? racimosPintones,
    int? racimosSobremaduros,
    int? racimosMaduros,
  }) async {
    try {
      final CensoProductivoDao censoProductivoDao = db.censoProductivoDao;
      final nuevoCenso = CensoProductivoCompanion(
          fechaCenso: Value(fechaCenso),
          floresFemeninas: Value(floresFemeninas),
          floresMasculinas: Value(floresMasculinas),
          palmasLeidas: Value(palmasLeidas),
          racimosVerdes: Value(racimosVerdes),
          racimosPintones: Value(racimosPintones),
          racimosSobremaduros: Value(racimosSobremaduros),
          racimosMaduros: Value(racimosMaduros),
          nombreLote: Value(nombreLote),
          responsable: Value(globals.responsable));
      await censoProductivoDao.insertCenso(nuevoCenso);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> actualizarCensoProductivo({
    required DateTime fechaCenso,
    required String nombreLote,
    required int idCenso,
    int? floresFemeninas,
    int? floresMasculinas,
    int? palmasLeidas,
    int? racimosVerdes,
    int? racimosPintones,
    int? racimosSobremaduros,
    int? racimosMaduros,
  }) async {
    try {
      final CensoProductivoDao censoProductivoDao = db.censoProductivoDao;
      final nuevoCenso = CensoProductivoCompanion(
          id: Value(idCenso),
          fechaCenso: Value(fechaCenso),
          floresFemeninas: Value(floresFemeninas),
          floresMasculinas: Value(floresMasculinas),
          palmasLeidas: Value(palmasLeidas),
          racimosVerdes: Value(racimosVerdes),
          racimosPintones: Value(racimosPintones),
          racimosSobremaduros: Value(racimosSobremaduros),
          racimosMaduros: Value(racimosMaduros),
          nombreLote: Value(nombreLote),
          responsable: Value(globals.responsable));
      await censoProductivoDao
          .updateCenso(nuevoCenso..copyWith(sincronizado: const Value(false)));
      return true;
    } catch (e) {
      return false;
    }
  }

  getAllCensosProductvos(String nombreLote) async {
    final CensoProductivoDao censoProductivoDao = db.censoProductivoDao;
    final censos = await censoProductivoDao.getCensosPorLote(nombreLote);
    emit(state.copyWith(censos: censos));
  }
}

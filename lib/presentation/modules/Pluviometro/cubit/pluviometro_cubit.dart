import 'package:apppalma/data/moor/daos/lote_dao.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/main.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apppalma/globals.dart' as globals;

part 'pluviometro_state.dart';

class PluviometroCubit extends Cubit<PluviometroState> {
  PluviometroCubit() : super(PluviometroInitial());
  final db = getIt<AppDatabase>();

  Future<bool> agregarPrecipitacion(int cantidad, DateTime fecha) async {
    try {
      final LoteDao loteDao = db.loteDao;
      PrecipitacionCompanion p = PrecipitacionCompanion(
          cantidadPrecipitacion: Value(cantidad),
          fechaRegistroPrecipitacion: Value(fecha),
          responsable: Value(globals.responsable));
      await loteDao.agregarPrecipitacion(p);
      return true;
    } catch (e) {
      return false;
    }
  }
}

import 'package:apppalma/main.dart';
import 'package:apppalma/presentation/components/toasts/toasts.dart';
import 'package:apppalma/data/moor/daos/cosecha_daos.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apppalma/globals.dart' as globals;

part 'cosecha_state.dart';

class CosechaCubit extends Cubit<CosechaStateLoaded> {
  CosechaCubit() : super(const CosechaStateLoaded());
  final db = getIt<AppDatabase>();

  Future<List<Cosecha>> obtenerCosechasFinalizadas() async {
    final CosechaDao cosechaDao = db.cosechaDao;
    List<Cosecha> cosechas = await cosechaDao.getCosechasFinalizadas();
    cosechas.removeWhere((element) => element.idViaje != null);
    return cosechas;
    // emit()
  }

  obtenerCosechaActiva(String nombrelote) async {
    emit(const CosechaStateLoaded(isLoaded: false));
    final CosechaDao cosechaDao = db.cosechaDao;
    final Cosecha? cosecha = await cosechaDao.getCosechaActiva(nombrelote);
    List<CosechaDiariaData> cosechasDiarias = [];
    if (cosecha != null) {
      cosechasDiarias = await obtenerCosechasDiarias(cosecha.id);
    }
    emit(CosechaStateLoaded(
        cosecha: cosecha, cosechasDiarias: cosechasDiarias, isLoaded: true));
  }

  comenzarNuevaCosecha(String nombrelote, DateTime fecha) async {
    final CosechaDao cosechaDao = db.cosechaDao;
    final cosecha = CosechasCompanion(
      nombreLote: Value(nombrelote),
      fechaIngreso: Value(fecha),
      cantidadRacimos: const Value(0),
      kilos: const Value(0),
    );
    await cosechaDao.insertCosecha(cosecha);
    obtenerCosechaActiva(nombrelote);
  }

  Future<List<CosechaDiariaData>> obtenerCosechasDiarias(int idCosecha) async {
    final CosechaDiariaDao cosechaDiariaDao = db.cosechaDiariaDao;
    final List<CosechaDiariaData> cosechasdiarias =
        await cosechaDiariaDao.getCosechasDiarias(idCosecha);
    return cosechasdiarias;
  }

  insertarCosechaDiaria(
      DateTime fecha, int racimos, int kilos, Cosecha cosecha) async {
    try {
      final nuevosRacimos = cosecha.cantidadRacimos + racimos;
      final nuevosKilos = cosecha.kilos + kilos;
      final CosechaDiariaDao cosechaDiariaDao = db.cosechaDiariaDao;
      final CosechaDao cosechaDao = db.cosechaDao;
      final cosechaDiariaCompanion = CosechaDiariaCompanion(
          fechaIngreso: Value(fecha),
          cantidadRacimos: Value(racimos),
          responsable: Value(globals.responsable),
          kilos: Value(kilos),
          idCosecha: Value(cosecha.id));
      await cosechaDiariaDao.insertCosechaDiaria(cosechaDiariaCompanion);
      cosechaDao.updateCosecha(cosecha.copyWith(
          cantidadRacimos: nuevosRacimos,
          kilos: nuevosKilos,
          sincronizado: false));
      obtenerCosechaActiva(cosecha.nombreLote);
    } catch (_) {}
  }

  finalizarCosecha(Cosecha cosecha, DateTime fechasalida) {
    final CosechaDao cosechaDao = db.cosechaDao;
    cosechaDao.updateCosecha(
        cosecha.copyWith(fechaSalida: Value(fechasalida), completada: true));
    obtenerCosechaActiva(cosecha.nombreLote);
    successMessageToast('La cosecha se finalizo correctamente');
  }
}

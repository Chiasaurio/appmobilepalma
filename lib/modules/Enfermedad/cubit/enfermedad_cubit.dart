import 'package:apppalma/main.dart';
import 'package:apppalma/moor/daos/enfermedades_dao.dart';
import 'package:apppalma/moor/daos/palma_daos.dart';
import 'package:apppalma/moor/daos/registroenfermedad_dao.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/enfermedades_table.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/toasts/toasts.dart';
import '../../../utils/form_status.dart';

part 'enfermedad_state.dart';

class EnfermedadCubit extends Cubit<EnfermedadState> {
  EnfermedadCubit() : super(const EnfermedadState());
  final db = getIt<AppDatabase>();

  initCubit(String nombreLote) {
    emit(state.copyWith(nombreLote: nombreLote));
  }

  observacionesChanged(String value) {
    emit(state.copyWith(observaciones: value));
  }

  Future<void> lineaDePalmaChanged(int? lineaPalma) async {
    emit(state.copyWith(lineaPalma: lineaPalma));
  }

  Future<void> numeroDePalmaChanged(int? numeroPalma) async {
    emit(state.copyWith(numeroPalma: numeroPalma));
  }

  Future<void> etapaChanged(Etapa? etapa) async {
    emit(state.copyWith(etapaSeleccionada: etapa));
  }

  Future<void> enfermedadChange(Enfermedade? enfermedad) async {
    emit(state.copyWith(enfermedadSeleccionada: enfermedad));
  }

  Future<void> insertarPalmaConEnfermedad(
    DateTime fecha,
  ) async {
    try {
      final RegistroEnfermedadDao registroEnfermedadDao =
          db.registroEnfermedadDao;
      final PalmaDao palmaDao = db.palmaDao;
      final palmaNueva = PalmasCompanion(
        numeroenlinea: Value(state.numeroPalma!),
        numerolinea: Value(state.lineaPalma!),
        nombreLote: Value(state.nombreLote!),
        estadopalma: const Value("sdsd"),
      );

      final id = await palmaDao.insertPalma(palmaNueva);
      final regitroEnf = RegistroEnfermedadCompanion(
        idPalma: Value(id),
        fechaRegistro: Value(fecha),
        horaRegistro: Value(fecha),
        idEtapaEnfermedad: Value(state.etapaSeleccionada!.id),
        nombreEnfermedad: Value(state.enfermedadSeleccionada!.nombreEnfermedad),
        observaciones: Value(state.observaciones),
      );
      await registroEnfermedadDao.insertRegistroEnfermedad(regitroEnf);
      registroExitosoToast();
    } catch (e) {
      registroFallidoToast('Error al realizar el registro');
    }
  }

  Future<void> obtenerTodasEnfermedadesConEtapas() async {
    final EnfermedadesDao enfermedadDao = db.enfermedadesDao;
    List<EnfermedadConEtapas> enfermedades =
        await enfermedadDao.obtenerEnfermedadConEtapas();
    emit(state.copyWith(enfermedades: enfermedades));
  }

  addEnfermedadyEtapasFromServerToLocal(Map<String, List> map) async {
    List<Insertable<Enfermedade>> enfermedades =
        map["enfermedades"] as List<Insertable<Enfermedade>>;
    List<Insertable<Etapa>> etapas = map["etapas"] as List<Insertable<Etapa>>;
    final EnfermedadesDao enfermedadDao = db.enfermedadesDao;
    await enfermedadDao.addEnfermedades(enfermedades, etapas);
  }
}

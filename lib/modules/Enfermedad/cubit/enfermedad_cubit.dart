import 'package:apppalma/constants.dart';
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
    emit(state.copyWith(
      nombreLote: nombreLote,
    ));
  }

  resetState() {
    emit(EnfermedadState(
      nombreLote: state.nombreLote,
    ));
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
      final PalmaDao palmaDao = db.palmaDao;
      String estadoPalma = '';
      final palmaExistente = await palmaDao.obtenerPalma(
          state.nombreLote!, state.lineaPalma!, state.numeroPalma!);
      if (state.enfermedadSeleccionada!.procedimientoEnfermedad ==
          "Erradicación") {
        estadoPalma = EstadosPalma.pendientePorErradicar;
      } else if (palmaExistente != null) {
        if (palmaExistente.estadopalma == EstadosPalma.pendientePorErradicar) {
          estadoPalma = EstadosPalma.pendientePorErradicar;
        } else if (palmaExistente.estadopalma == EstadosPalma.erradicada) {
          estadoPalma = EstadosPalma.erradicada;
        } else {
          estadoPalma = EstadosPalma.reincidente;
        }
      } else {
        estadoPalma = EstadosPalma.pendientePorTratar;
      }
      final RegistroEnfermedadDao registroEnfermedadDao =
          db.registroEnfermedadDao;
      final idPalma = state.numeroPalma!.toString() +
          state.lineaPalma!.toString() +
          state.nombreLote!;
      final palmaNueva = PalmasCompanion(
        identificador: Value(idPalma),
        numeroenlinea: Value(state.numeroPalma!),
        numerolinea: Value(state.lineaPalma!),
        nombreLote: Value(state.nombreLote!),
        estadopalma: Value(estadoPalma),
      );

      await palmaDao.insertPalmaOrUpdate(palmaNueva);

      final regitroEnf = RegistroEnfermedadCompanion(
        idPalma: Value(idPalma),
        fechaRegistro: Value(fecha),
        horaRegistro: Value(fecha),
        idEtapaEnfermedad: Value(state.etapaSeleccionada?.id),
        nombreEnfermedad: Value(state.enfermedadSeleccionada!.nombreEnfermedad),
        observaciones: Value(state.observaciones),
      );
      await registroEnfermedadDao.insertRegistroEnfermedad(regitroEnf);
      emit(state.copyWith(status: FormStatus.submissionSuccess));
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

import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/data/moor/tables/enfermedades_table.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:apppalma/utils/get_palma_identificador.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/moor/daos/daos.dart';
import 'package:apppalma/globals.dart' as globals;

part 'enfermedad_state.dart';

class EnfermedadCubit extends Cubit<EnfermedadState> {
  EnfermedadCubit() : super(const EnfermedadState());
  final db = getIt<AppDatabase>();

  initCubit(String nombreLote) {
    emit(EnfermedadState(
      nombreLote: nombreLote,
    ));
  }

  resetState() {
    emit(EnfermedadState(
      nombreLote: state.nombreLote,
    ));
  }

  changeOrientacion(String value) {
    emit(state.copyWith(orientacion: value));
  }

  changeObservaciones(String value) {
    emit(state.copyWith(observaciones: value));
  }

  Future<void> changeLinea(int? lineaPalma) async {
    emit(state.copyWith(lineaPalma: lineaPalma));
  }

  Future<void> changeNumero(int? numeroPalma) async {
    emit(state.copyWith(numeroPalma: numeroPalma));
  }

  Future<void> etapaChanged(Etapa? etapa) async {
    emit(state.copyWith(etapaSeleccionada: etapa));
  }

  Future<void> enfermedadChange(Enfermedade? enfermedad) async {
    emit(state.copyWith(enfermedadSeleccionada: enfermedad));
  }

  changeImagenes(List<XFile> imagenes) {
    emit(state.copyWith(imagenes: imagenes));
  }

  Future<bool> insertarPalmaConEnfermedad(
    DateTime fecha,
  ) async {
    try {
      //Se verifica si la palma ya esta registrada para definir el estado
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
          //Si ya esta erradicada no cambia el estado, aunque este caso no deberia suceder
          estadoPalma = EstadosPalma.erradicada;
        } else {
          //Cualquier otro estado de la palma existente es reincidente
          estadoPalma = EstadosPalma.reincidente;
        }
      } else {
        //Si la palma no existe y la enfermedad no es para erradicar
        estadoPalma = EstadosPalma.pendientePorTratar;
      }
      // final RegistroEnfermedadDao registroEnfermedadDao =
      //     db.registroEnfermedadDao;
      final idPalma = generateIdentifier(
          state.numeroPalma!, state.lineaPalma!, state.nombreLote!);
      final palmaNueva = PalmasCompanion(
        orientacion: Value(state.orientacion!),
        identificador: Value(idPalma),
        numeroenlinea: Value(state.numeroPalma!),
        numerolinea: Value(state.lineaPalma!),
        nombreLote: Value(state.nombreLote!),
        estadopalma: Value(estadoPalma),
      );
      //Se actualiza o se crea la palma

      final regitroEnf = RegistroEnfermedadCompanion(
        idPalma: Value(idPalma),
        fechaRegistro: Value(fecha),
        horaRegistro: Value(fecha),
        responsable: Value(globals.responsable),
        idEtapaEnfermedad: Value(state.etapaSeleccionada?.id),
        nombreEnfermedad: Value(state.enfermedadSeleccionada!.nombreEnfermedad),
        observaciones: Value(state.observaciones),
      );
      await palmaDao.insertPalmaConEnfermedad(
          palmaNueva, regitroEnf, state.imagenes ?? []);
      // await registroEnfermedadDao.insertRegistroEnfermedad(
      //     regitroEnf, state.imagenes ?? []);
      emit(state.copyWith(status: FormStatus.submissionSuccess));
      return true;
    } catch (e) {
      return false;
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

  Future<bool> darDeAltaEnfermedad(
      {required Palma palma,
      required RegistroEnfermedadData registroEnfermedad}) async {
    try {
      final RegistroEnfermedadDao registroEnfermedadDao =
          db.registroEnfermedadDao;
      final PalmaDao palmaDao = db.palmaDao;
      await registroEnfermedadDao
          .updateRegistro(registroEnfermedad.copyWith(dadaDeAlta: true));
      await palmaDao.updatePalma(palma.copyWith(estadopalma: "Dada de alta"));
      return true;
    } catch (e) {
      return false;
    }
  }
}

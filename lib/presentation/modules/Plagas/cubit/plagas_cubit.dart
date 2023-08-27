import 'package:apppalma/data/moor/daos/daos.dart';
import 'package:apppalma/presentation/components/toasts/toasts.dart';
import 'package:apppalma/data/moor/tables/plagas_table.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/presentation/modules/Plagas/models/etapa_individuo_model.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:apppalma/utils/get_location.dart';
import 'package:apppalma/utils/get_palma_identificador.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:apppalma/globals.dart' as globals;

import '../../../constants.dart';
part 'plagas_state.dart';

class PlagasCubit extends Cubit<PlagasState> {
  PlagasCubit() : super(const PlagasState());
  final db = getIt<AppDatabase>();

  clear(String nombreLote) {
    emit(PlagasState(nombreLote: nombreLote));
  }

  changeEtapa(List<EtapaIndividuosModel> etapasseleccionadas) {
    emit(state.copyWith(etapasSeleccionada: etapasseleccionadas));
  }

  changePlaga(PlagaConEtapas plaga) {
    emit(state.copyWith(plagaSeleccionada: plaga));
  }

  changeOrientacion(String orientacion) {
    emit(state.copyWith(orientacion: orientacion));
  }

  changeLinea(int? linea) {
    emit(state.copyWith(linea: linea));
  }

  changeNumero(int? numero) {
    emit(state.copyWith(numero: numero));
  }

  changeNumeroIndividuos(int? numeroIndividuos) {
    emit(state.copyWith(numeroIndividuos: numeroIndividuos));
  }

  changeObservaciones(String observacion) {
    emit(state.copyWith(observaciones: observacion));
  }

  changeImagenes(List<XFile> imagenes) {
    emit(state.copyWith(imagenes: imagenes));
  }

  addPlagayEtapasFromServerToLocal(Map<String, List> map) async {
    List<Insertable<Plaga>> plagas = map["plagas"] as List<Insertable<Plaga>>;
    List<Insertable<EtapasPlagaData>> etapas =
        map["etapas"] as List<Insertable<EtapasPlagaData>>;
    final PlagasDao plagasDao = db.plagasDao;
    await plagasDao.insertPlagas(plagas, etapas);
  }

  Future<void> obtenerTodasPlagasConEtapas() async {
    final PlagasDao plagasDao = db.plagasDao;
    List<PlagaConEtapas> plagas = await plagasDao.obtenerPlagaConEtapas();
    emit(state.copyWith(plagas: plagas));
  }

  Future<void> insertarCenso(
    DateTime fechacenso,
  ) async {
    // final PlagasDao plagaDao = db.plagasDao;
    final PalmaDao palmaDao = db.palmaDao;
    try {
      emit(state.copyWith(status: FormStatus.submissionInProgress));
      final String identificadorPalma =
          generateIdentifier(state.linea!, state.numero!, state.nombreLote!);

      //Se crea o se actualiza la palma.
      final palmaNueva = PalmasCompanion(
        orientacion: Value(state.orientacion!),
        identificador: Value(identificadorPalma),
        numeroenlinea: Value(state.numero!),
        numerolinea: Value(state.linea!),
        nombreLote: Value(state.nombreLote!),
        estadopalma: const Value(EstadosPalma.pendientePorTratar),
      );
      final LocationData? locationData = await getCurrentLocation();

      //Se actualiza o se crea la palma
      final registroPlag = CensoCompanion(
          fechaCenso: Value(fechacenso),
          // presenciaLote: Value(presencialote),
          // presenciaSector: Value(presenciasector),
          // lineaLimite1: Value(linealimite1),
          // lineaLimite2: Value(linealimite2),
          identificador: Value(identificadorPalma),
          responsable: Value(globals.responsable),
          numeroIndividuos: Value(
            state.numeroIndividuos,
          ),
          observacionCenso: Value(
            state.observaciones,
          ),
          nombrePlaga: Value(
            state.plagaSeleccionada!.plaga.nombreComunPlaga,
          ),
          nombreLote: Value(
            state.nombreLote!,
          ),
          longitude: Value(locationData?.longitude),
          latitude: Value(locationData?.latitude));

      await palmaDao.insertPalmaConPlaga(palmaNueva, state.etapasSeleccionada,
          registroPlag, state.imagenes ?? []);

      //Se inserta el censo
      // await plagaDao.insertCensoDePlaga(
      //     fechacenso,
      //     identificadorPalma,
      //     state.numeroIndividuos,
      //     state.observaciones,
      //     state.plagaSeleccionada!.plaga.nombreComunPlaga,
      //     state.nombreLote!,
      //     state.etapasSeleccionada,
      //     state.imagenes ?? []);
      emit(state.copyWith(status: FormStatus.submissionSuccess));
      registroExitosoToast();
    } catch (e) {
      registroFallidoToast(e.toString());
    }
  }
}

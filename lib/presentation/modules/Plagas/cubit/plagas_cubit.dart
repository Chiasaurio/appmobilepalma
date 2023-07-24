import 'package:apppalma/presentation/components/toasts/toasts.dart';
import 'package:apppalma/data/moor/daos/plagas_daos.dart';
import 'package:apppalma/data/moor/tables/plagas_table.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/presentation/modules/Plagas/models/etapa_individuo_model.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:apppalma/utils/get_palma_identificador.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'plagas_state.dart';

class PlagasCubit extends Cubit<PlagasState> {
  PlagasCubit() : super(const PlagasState());
  final db = getIt<AppDatabase>();

  clear(String nombreLote) {
    emit(PlagasState(nombreLote: nombreLote));
  }

  comenzarTomaDePlagas() {
    emit(state.copyWith(isProcessRunning: true));
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
    final PlagasDao plagaDao = db.plagasDao;
    try {
      emit(state.copyWith(status: FormStatus.submissionInProgress));
      final String identificadorPalma =
          generateIdentifier(state.linea!, state.numero!, state.nombreLote!);
      await plagaDao.insertCensoDePlaga(
          fechacenso,
          identificadorPalma,
          state.numeroIndividuos,
          state.observaciones,
          state.plagaSeleccionada!.plaga.nombreComunPlaga,
          state.nombreLote!,
          state.etapasSeleccionada);
      emit(state.copyWith(status: FormStatus.submissionSuccess));
      registroExitosoToast();
    } catch (e) {
      registroFallidoToast(e.toString());
    }
  }
}

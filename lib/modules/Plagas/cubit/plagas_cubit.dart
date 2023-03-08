import 'package:apppalma/components/toasts/toasts.dart';
import 'package:apppalma/data/moor/daos/plagas_daos.dart';
import 'package:apppalma/data/moor/tables/plagas_table.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/form_status.dart';

part 'plagas_state.dart';

class PlagasCubit extends Cubit<PlagasState> {
  PlagasCubit() : super(const PlagasState());
  final db = getIt<AppDatabase>();

  clear(String nombreLote) {
    emit(PlagasState(nombreLote: nombreLote));
  }

  changeEtapa(List<EtapasPlagaData> etapasseleccionadas) {
    emit(state.copyWith(etapasSeleccionada: etapasseleccionadas));
  }

  changePresencia(String presencia) {
    if (presencia == "lote") {
      emit(state.copyWith(
          presencialote: true, presenciasector: false, limite1: 0, limite2: 0));
    } else {
      emit(state.copyWith(
        presencialote: false,
        presenciasector: true,
      ));
    }
  }

  changePlaga(PlagaConEtapas plaga) {
    emit(state.copyWith(plagaSeleccionada: plaga));
  }

  changeLimite1(int limite1) {
    emit(state.copyWith(limite1: limite1));
  }

  changeLimite2(int limite2) {
    emit(state.copyWith(limite2: limite2));
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
      await plagaDao.insertCensoDePlaga(
          fechacenso,
          state.presencialote,
          state.presenciasector,
          state.limite1!,
          state.limite2!,
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

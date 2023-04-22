import 'package:apppalma/data/moor/daos/viajes_dao.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../components/toasts/toasts.dart';

part 'peso_extractora_state.dart';

class PesoExtractoraCubit extends Cubit<PesoExtractoraState> {
  PesoExtractoraCubit() : super(const PesoExtractoraState());
  final db = getIt<AppDatabase>();

  void initPesoExtractoraPage(Viaje viaje) {
    emit(state.copyWith(viaje: viaje));
  }

  void setPesoExtractora(double peso) {
    emit(state.copyWith(pesoExtractora: peso));
  }

  void confirmarPesoExtractora() async {
    try {
      emit(state.copyWith(status: FormStatus.noSubmitted));
      ViajesDao viajesDao = db.viajesDao;
      await viajesDao.updateViaje(
          state.viaje!.copyWith(kilosExtractora: Value(state.pesoExtractora)));
      successMessageToast('El peso de la extractora se registro exitosamente');
      emit(state.copyWith(status: FormStatus.submissionSuccess));
    } catch (e) {
      registroFallidoToast(
          'Error al registrar el peso, por favor intente de nuevo');
      emit(state.copyWith(status: FormStatus.submissionFailure));
    }
  }
}

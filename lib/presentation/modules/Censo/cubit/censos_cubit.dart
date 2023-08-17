import 'package:apppalma/data/moor/daos/plagas_daos.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'censos_state.dart';

class CensosCubit extends Cubit<CensosState> {
  CensosCubit() : super(const CensosState());

  final db = getIt<AppDatabase>();

  Future<void> obtenerCensosPendientes(String nombreLote) async {
    final PlagasDao plagasDao = db.plagasDao;
    List<CensoData> censos = await plagasDao.getCensosPendientes(nombreLote);
    emit(CensosState(censos: censos));
  }

  Future<void> censoPendienteEscogido(CensoData censo) async {
    emit(state.copyWith(
      censo: censo,
    ));
  }

  Future<void> daraltaCenso(CensoData censo) async {
    final PlagasDao plagasDao = db.plagasDao;
    plagasDao.updateCenso(
        censo.copyWith(estadoPlaga: 'eliminado', sincronizado: false));
    obtenerTodosCensos();
  }

  Future<List<CensoData>> obtenerTodosCensos() async {
    final PlagasDao plagasDao = db.plagasDao;
    List<CensoData> censos = await plagasDao.obtenerTodosCensos();
    return censos;
  }
}

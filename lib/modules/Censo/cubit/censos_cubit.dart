import 'package:apppalma/main.dart';
import 'package:apppalma/moor/daos/fumigacion_dao.dart';
import 'package:apppalma/moor/daos/plagas_daos.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'censos_state.dart';

class CensosCubit extends Cubit<CensosState> {
  CensosCubit() : super(CensosInitial());

  final db = getIt<AppDatabase>();

  Future<void> obtenerCensosPendientes() async {
    final FumigacionDao fumigacionDao = db.fumigacionDao;
    final PlagasDao plagasDao = db.plagasDao;
    List<CensoData> censos = await plagasDao.getCensosPendientes();
    emit(CensosListLoaded(censos: censos));
  }

  Future<void> censoPendienteEscogido(CensoData censo) async {
    emit(CensoPendienteEscogido(
      censo: censo,
    ));
  }

  Future<void> daraltaCenso(CensoData censo) async {
    final PlagasDao plagasDao = db.plagasDao;
    plagasDao.updateCenso(censo.copyWith(estadoPlaga: 'eliminado'));
    obtenerTodosCensos();
  }

  Future<List<CensoData>> obtenerTodosCensos() async {
    final PlagasDao plagasDao = db.plagasDao;
    List<CensoData> censos = await plagasDao.obtenerTodosCensos();
    return censos;
  }
}

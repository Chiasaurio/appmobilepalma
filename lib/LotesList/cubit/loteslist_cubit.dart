import 'package:apppalma/moor/daos/lote_dao.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/lotes_table.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loteslist_state.dart';

class LoteslistCubit extends Cubit<LoteslistState> {
  LoteslistCubit() : super(LoteslistInitial());
  final AppDatabase db = AppDatabase();

  Future<void> obtenerTodosLotesWithProcesos() async {
    final LoteDao loteDao = db.loteDao;
    List<LoteWithProcesos> lotes = await loteDao.getLotesWithProcesos();
    emit(LotesListLoaded(lotes: lotes));
  }
}

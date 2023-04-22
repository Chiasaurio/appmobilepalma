import 'package:apppalma/data/moor/daos/lote_dao.dart';
import 'package:apppalma/data/moor/tables/lotes_table.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'loteslist_state.dart';

class LoteslistCubit extends Cubit<LoteslistState> {
  LoteslistCubit() : super(LoteslistInitial());
  final db = getIt<AppDatabase>();

  Future<void> obtenerTodosLotesWithProcesos() async {
    emit(LoteslistInitial());
    final LoteDao loteDao = db.loteDao;
    List<LoteWithProcesos> lotes = await loteDao.getLotesWithProcesos();
    emit(LotesListLoaded(lotes: lotes));
  }

  Future<void> addLotesFromServerToLocal(List<Insertable<Lote>> lotes) async {
    final LoteDao loteDao = db.loteDao;
    await loteDao.addLotes(lotes);
  }
}

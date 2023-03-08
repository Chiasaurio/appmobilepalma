import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/moor/daos/lote_dao.dart';
import '../../../data/moor/moor_database.dart';
import '../../../data/moor/tables/lotes_table.dart';
import '../../../main.dart';

part 'lote_detail_state.dart';

class LoteDetailCubit extends Cubit<LoteDetailState> {
  LoteDetailCubit() : super(LoteDetailInitial());
  final db = getIt<AppDatabase>();

  loteEscogido(LoteWithProcesos lote) {
    emit(LoteDetailInitial());

    emit(LoteChoosed(lote: lote));
  }

  reoadLote(int idlote) async {
    emit(LoteDetailInitial());
    final LoteDao loteDao = db.loteDao;
    // LoteWithProcesos lote = await loteDao.getSingleLote();
    LoteWithProcesos lote = await loteDao.getSingleLote(idlote);

    emit(LoteChoosed(lote: lote));
  }
}

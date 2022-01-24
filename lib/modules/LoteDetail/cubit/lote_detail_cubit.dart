import 'package:apppalma/moor/moor_database.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lote_detail_state.dart';

class LoteDetailCubit extends Cubit<LoteDetailState> {
  LoteDetailCubit() : super(LoteDetailInitial());

  loteEscogido(Lote lote) {
    emit(LoteChoosed(lote: lote));
  }
}

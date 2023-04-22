part of 'lote_detail_cubit.dart';

abstract class LoteDetailState {}

class LoteDetailInitial extends LoteDetailState {}

class LoteChoosed extends LoteDetailState {
  final LoteWithProcesos lote;

  LoteChoosed({required this.lote});
}

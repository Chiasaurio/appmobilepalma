part of 'lote_detail_cubit.dart';

@immutable
abstract class LoteDetailState {}

class LoteDetailInitial extends LoteDetailState {}

class LoteChoosed extends LoteDetailState {
  final Lote lote;

  LoteChoosed({required this.lote});
}

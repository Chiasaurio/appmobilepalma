part of 'loteslist_cubit.dart';

abstract class LoteslistState {}

class LoteslistInitial extends LoteslistState {}

class LotesListLoaded extends LoteslistState {
  final List<LoteWithProcesos> lotes;

  LotesListLoaded({required this.lotes});
}

class LoadingLotesError extends LoteslistState {
  final String error;

  LoadingLotesError({required this.error});
}

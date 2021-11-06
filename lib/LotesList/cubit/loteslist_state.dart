part of 'loteslist_cubit.dart';

@immutable
abstract class LoteslistState {}

class LoteslistInitial extends LoteslistState {}

class LotesListLoaded extends LoteslistState {
  final List<LoteWithProcesos> lotes;

  LotesListLoaded({required this.lotes});
}

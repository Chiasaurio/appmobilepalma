part of 'censos_cubit.dart';

@immutable
abstract class CensosState {}

class CensosInitial extends CensosState {}

class CensosListLoaded extends CensosState {
  final List<CensoData> censos;

  CensosListLoaded({required this.censos});
}

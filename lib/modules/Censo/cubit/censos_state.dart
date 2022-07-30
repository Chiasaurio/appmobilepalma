part of 'censos_cubit.dart';

@immutable
abstract class CensosState {}

class CensosInitial extends CensosState {}

class CensosListLoaded extends CensosState {
  final List<CensoData> censos;

  CensosListLoaded({required this.censos});
}

class CensoPendienteEscogido extends CensosState {
  final CensoData censo;

  CensoPendienteEscogido({required this.censo});
  @override
  List<Object> get props => [
        censo,
      ];
}

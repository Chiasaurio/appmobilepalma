part of 'censos_cubit.dart';

abstract class CensosState extends Equatable {
  @override
  List<Object> get props => [];
}

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

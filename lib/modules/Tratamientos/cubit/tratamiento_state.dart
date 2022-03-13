part of 'tratamiento_cubit.dart';

abstract class TratamientoState extends Equatable {
  const TratamientoState();

  @override
  List<Object> get props => [];
}

class TratamientoInitial extends TratamientoState {}

class PalmasEnfermasLoaded extends TratamientoState {
  final List<PalmaConEnfermedad> palmasEnfermas;

  const PalmasEnfermasLoaded({required this.palmasEnfermas});
  @override
  List<Object> get props => [palmasEnfermas];
}

class PalmaEnfermaEscogida extends TratamientoState {
  final PalmaConEnfermedad palmaEnferma;
  final List<ProductoAgroquimicoData> productos;

  const PalmaEnfermaEscogida(
      {required this.palmaEnferma, required this.productos});
  @override
  List<Object> get props => [palmaEnferma, productos];
}

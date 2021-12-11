part of 'enfermedad_cubit.dart';

@immutable
abstract class EnfermedadState {}

class EnfermedadInitial extends EnfermedadState {}

class EnfermedadesConEtapasLoaded extends EnfermedadState {
  final List<EnfermedadConEtapas> enfermedades;

  EnfermedadesConEtapasLoaded({required this.enfermedades});
}

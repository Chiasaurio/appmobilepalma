part of 'plagas_cubit.dart';

abstract class PlagasState extends Equatable {
  const PlagasState();

  @override
  List<Object> get props => [];
}

class PlagasInitial extends PlagasState {}

class PlagasConEtapasLoaded extends PlagasState {
  final List<PlagaConEtapas> plagas;

  const PlagasConEtapasLoaded({required this.plagas});
}

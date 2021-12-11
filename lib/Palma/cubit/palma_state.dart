part of 'palma_cubit.dart';

@immutable
abstract class PalmaState {}

class PalmaInitial extends PalmaState {}

class PalmasLoteLoaded extends PalmaState {
  final List<Palma> palmas;

  PalmasLoteLoaded({required this.palmas});
}

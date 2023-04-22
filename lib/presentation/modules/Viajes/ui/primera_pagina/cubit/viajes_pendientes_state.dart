part of 'viajes_pendientes_cubit.dart';

class ViajesPendientesState extends Equatable {
  final List<Viaje>? viajesPendientes;
  const ViajesPendientesState({this.viajesPendientes});

  @override
  List<Object?> get props => [viajesPendientes];
}

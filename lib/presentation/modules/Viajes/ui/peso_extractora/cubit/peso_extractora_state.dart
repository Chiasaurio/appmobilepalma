part of 'peso_extractora_cubit.dart';

class PesoExtractoraState extends Equatable {
  final Viaje? viaje;
  final double pesoExtractora;
  final FormStatus status;
  const PesoExtractoraState(
      {this.viaje,
      this.pesoExtractora = 0.0,
      this.status = FormStatus.noSubmitted});
  PesoExtractoraState copyWith(
      {Viaje? viaje, double? pesoExtractora, FormStatus? status}) {
    return PesoExtractoraState(
        status: status ?? this.status,
        pesoExtractora: pesoExtractora ?? this.pesoExtractora,
        viaje: viaje ?? this.viaje);
  }

  @override
  List<Object?> get props => [viaje, pesoExtractora, status];
}

part of 'viaje_cubit.dart';

class ViajeInitial extends Equatable {
  final List<Cosecha> cosechasDelViaje;
  final num totalKilos;
  final num totalRacimos;
  final TimeOfDay? horaCarga;
  final TimeOfDay? horaSalida;
  final FormStatus status;

  const ViajeInitial(
      {required this.cosechasDelViaje,
      this.totalKilos = 0,
      this.totalRacimos = 0,
      this.status = FormStatus.noSubmitted,
      this.horaCarga,
      this.horaSalida});
  @override
  List<Object?> get props => [
        cosechasDelViaje,
        totalKilos,
        status,
        totalRacimos,
        horaCarga,
        horaSalida,
      ];

  ViajeInitial copyWith(
      {List<Cosecha>? cosechasDelViaje,
      num? totalKilos,
      num? totalRacimos,
      TimeOfDay? horaCarga,
      TimeOfDay? horaSalida,
      FormStatus? status}) {
    return ViajeInitial(
        horaCarga: horaCarga ?? this.horaCarga,
        horaSalida: horaSalida ?? this.horaSalida,
        status: status ?? this.status,
        cosechasDelViaje: cosechasDelViaje ?? this.cosechasDelViaje,
        totalRacimos: totalRacimos ?? this.totalRacimos,
        totalKilos: totalKilos ?? this.totalKilos);
  }
}

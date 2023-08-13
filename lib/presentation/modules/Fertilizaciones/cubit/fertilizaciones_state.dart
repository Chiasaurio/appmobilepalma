part of 'fertilizaciones_cubit.dart';

class FertilizacionStateLoaded extends Equatable {
  final Fertilizacione? fertilizacion;
  final List<FertilizacionDiariaData>? fertilizacionDarias;
  final List<FertilizanteData>? fertilizantes;
  final bool isLoaded;
  final FormStatus status;
  final String statusMsg;
  const FertilizacionStateLoaded({
    this.fertilizacion,
    this.fertilizacionDarias,
    this.fertilizantes,
    this.isLoaded = false,
    this.status = FormStatus.noSubmitted,
    this.statusMsg = '',
  });

  @override
  List<Object?> get props => [
        fertilizacion,
        fertilizacionDarias,
        fertilizantes,
        status,
        statusMsg,
        isLoaded,
      ];

  FertilizacionStateLoaded copyWith({
    Fertilizacione? fertilizacion,
    List<FertilizacionDiariaData>? fertilizacionDarias,
    List<FertilizanteData>? fertilizantes,
    bool? isLoaded,
    FormStatus? status,
    String? statusMsg,
  }) {
    return FertilizacionStateLoaded(
      fertilizacion: fertilizacion ?? this.fertilizacion,
      fertilizacionDarias: fertilizacionDarias ?? this.fertilizacionDarias,
      fertilizantes: fertilizantes ?? this.fertilizantes,
      isLoaded: isLoaded ?? this.isLoaded,
      status: status ?? this.status,
      statusMsg: statusMsg ?? this.statusMsg,
    );
  }
}

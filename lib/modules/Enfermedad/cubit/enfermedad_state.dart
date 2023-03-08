part of 'enfermedad_cubit.dart';

// abstract class EnfermedadState {
//   final FormStatus status;

//   EnfermedadState({ this.status = FormStatus.noSubmitted,});
//   //     this.status = FormStatus.noSubmitted,
//   // FormStatus? status,

// }

// class EnfermedadInitial extends EnfermedadState {}

class EnfermedadState extends Equatable {
  final FormStatus status;
  final List<EnfermedadConEtapas>? enfermedades;
  final Enfermedade? enfermedadSeleccionada;
  final Etapa? etapaSeleccionada;
  final String? observaciones;
  final String? nombreLote;
  final int? lineaPalma;
  final int? numeroPalma;
  final String? orientacion;
  final bool? otraEnfermedad;

  const EnfermedadState({
    this.enfermedades,
    this.enfermedadSeleccionada,
    this.etapaSeleccionada,
    this.status = FormStatus.noSubmitted,
    this.nombreLote,
    this.lineaPalma,
    this.numeroPalma,
    this.orientacion,
    this.otraEnfermedad,
    this.observaciones,
  });
  EnfermedadState copyWith({
    List<EnfermedadConEtapas>? enfermedades,
    Enfermedade? enfermedadSeleccionada,
    Etapa? etapaSeleccionada,
    FormStatus? status,
    String? observaciones,
    String? nombreLote,
    String? orientacion,
    int? lineaPalma,
    bool? otraEnfermedad,
    int? numeroPalma,
  }) {
    return EnfermedadState(
        orientacion: orientacion ?? this.orientacion,
        enfermedades: enfermedades ?? this.enfermedades,
        status: status ?? this.status,
        etapaSeleccionada: etapaSeleccionada ?? this.etapaSeleccionada,
        enfermedadSeleccionada:
            enfermedadSeleccionada ?? this.enfermedadSeleccionada,
        nombreLote: nombreLote ?? this.nombreLote,
        lineaPalma: lineaPalma ?? this.lineaPalma,
        numeroPalma: numeroPalma ?? this.numeroPalma,
        observaciones: observaciones ?? this.observaciones,
        otraEnfermedad: otraEnfermedad ?? this.otraEnfermedad);
  }

  @override
  List<Object?> get props => [
        enfermedades,
        enfermedadSeleccionada,
        etapaSeleccionada,
        status,
        orientacion,
        nombreLote,
        lineaPalma,
        numeroPalma,
        observaciones,
        otraEnfermedad,
      ];
}

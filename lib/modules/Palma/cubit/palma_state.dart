part of 'palma_cubit.dart';

abstract class PalmaState extends Equatable {
  final FormStatus status;
  final List<Palma>? palmas;
  final PalmaConProcesos? palmaSeleccionada;
  final String? observaciones;
  final String? nombreLote;
  final int? lineaPalma;
  final int? numeroPalma;
  final String? causa;

  const PalmaState({
    this.palmaSeleccionada,
    this.palmas,
    this.status = FormStatus.noSubmitted,
    this.nombreLote,
    this.lineaPalma,
    this.numeroPalma,
    this.observaciones,
    this.causa,
  });
  copyWith({
    List<Palma>? palmas,
    PalmaConProcesos? palmaSeleccionada,
    FormStatus? status,
    String? observaciones,
    String? nombreLote,
    int? lineaPalma,
    int? numeroPalma,
    String? causa,
  }) {}
  @override
  List<Object?> get props => [
        palmas,
        palmaSeleccionada,
        causa,
        status,
        nombreLote,
        lineaPalma,
        numeroPalma,
        observaciones,
      ];
}

class PalmaInitial extends PalmaState {
  const PalmaInitial({
    super.palmaSeleccionada,
    super.palmas,
    super.status = FormStatus.noSubmitted,
    super.nombreLote,
    super.lineaPalma,
    super.causa,
    super.numeroPalma,
    super.observaciones,
  });
  @override
  PalmaState copyWith({
    List<Palma>? palmas,
    PalmaConProcesos? palmaSeleccionada,
    String? causa,
    FormStatus? status,
    String? observaciones,
    String? nombreLote,
    int? lineaPalma,
    int? numeroPalma,
  }) {
    return PalmaInitial(
      causa: causa ?? this.causa,
      palmas: palmas ?? this.palmas,
      status: status ?? this.status,
      palmaSeleccionada: palmaSeleccionada ?? this.palmaSeleccionada,
      nombreLote: nombreLote ?? this.nombreLote,
      lineaPalma: lineaPalma ?? this.lineaPalma,
      numeroPalma: numeroPalma ?? this.numeroPalma,
      observaciones: observaciones ?? this.observaciones,
    );
  }

  @override
  List<Object?> get props => [
        palmas,
        palmaSeleccionada,
        status,
        nombreLote,
        lineaPalma,
        numeroPalma,
        observaciones,
      ];
}

class ErradicacionSinCausa extends PalmaState {
  const ErradicacionSinCausa(
      {super.status,
      super.numeroPalma,
      super.lineaPalma,
      super.palmaSeleccionada,
      super.causa,
      super.nombreLote});

  @override
  PalmaState copyWith({
    List<Palma>? palmas,
    PalmaConProcesos? palmaSeleccionada,
    FormStatus? status,
    String? observaciones,
    String? nombreLote,
    int? lineaPalma,
    int? numeroPalma,
    String? causa,
  }) {
    return ErradicacionSinCausa(
      causa: causa ?? this.causa,
      status: status ?? this.status,
      palmaSeleccionada: palmaSeleccionada ?? this.palmaSeleccionada,
      nombreLote: nombreLote ?? this.nombreLote,
      lineaPalma: lineaPalma ?? this.lineaPalma,
      numeroPalma: numeroPalma ?? this.numeroPalma,
      // observaciones: observaciones ?? this.observaciones,
    );
  }

  @override
  List<Object?> get props => [
        palmas,
        palmaSeleccionada,
        status,
        nombreLote,
        lineaPalma,
        numeroPalma,
        observaciones,
        causa
      ];
}

class ErradicacionConCausa extends PalmaState {
  const ErradicacionConCausa(
      {super.lineaPalma,
      super.numeroPalma,
      super.observaciones,
      super.status,
      super.palmaSeleccionada,
      super.causa,
      super.nombreLote});
  @override
  PalmaState copyWith({
    List<Palma>? palmas,
    PalmaConProcesos? palmaSeleccionada,
    FormStatus? status,
    String? observaciones,
    String? nombreLote,
    int? lineaPalma,
    int? numeroPalma,
    String? causa,
  }) {
    return ErradicacionConCausa(
      causa: causa ?? this.causa,
      status: status ?? this.status,
      palmaSeleccionada: palmaSeleccionada ?? this.palmaSeleccionada,
      nombreLote: nombreLote ?? this.nombreLote,
      lineaPalma: lineaPalma ?? this.lineaPalma,
      numeroPalma: numeroPalma ?? this.numeroPalma,
      observaciones: observaciones ?? this.observaciones,
    );
  }

  @override
  List<Object?> get props => [
        palmas,
        palmaSeleccionada,
        status,
        nombreLote,
        lineaPalma,
        numeroPalma,
        observaciones,
        causa
      ];
}

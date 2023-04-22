part of 'palma_cubit.dart';

abstract class PalmaState extends Equatable {
  final FormStatus status;
  final List<Palma>? palmas;
  final PalmaConProcesos? palmaSeleccionada;
  final String? observaciones;
  final String? nombreLote;
  final String? orientacion;
  final int? lineaPalma;
  final int? numeroPalma;
  final String? causa;

  const PalmaState({
    this.palmaSeleccionada,
    this.palmas,
    this.status = FormStatus.noSubmitted,
    this.nombreLote,
    this.orientacion,
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
    String? orientacion,
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
        orientacion,
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
    super.orientacion,
  });
  @override
  PalmaState copyWith({
    List<Palma>? palmas,
    PalmaConProcesos? palmaSeleccionada,
    String? causa,
    String? orientacion,
    FormStatus? status,
    String? observaciones,
    String? nombreLote,
    int? lineaPalma,
    int? numeroPalma,
  }) {
    return PalmaInitial(
      orientacion: orientacion ?? this.orientacion,
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
        orientacion,
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
      super.orientacion,
      super.nombreLote});

  @override
  PalmaState copyWith({
    List<Palma>? palmas,
    PalmaConProcesos? palmaSeleccionada,
    FormStatus? status,
    String? orientacion,
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
      orientacion: orientacion ?? this.orientacion,
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
        orientacion,
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
      super.orientacion,
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
    String? orientacion,
    int? numeroPalma,
    String? causa,
  }) {
    return ErradicacionConCausa(
      causa: causa ?? this.causa,
      status: status ?? this.status,
      palmaSeleccionada: palmaSeleccionada ?? this.palmaSeleccionada,
      orientacion: orientacion ?? this.orientacion,
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
        orientacion,
        numeroPalma,
        observaciones,
        causa
      ];
}

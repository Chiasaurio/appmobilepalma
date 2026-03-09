part of 'erradicacion_cubit.dart';

class ErradicacionConCausa extends Equatable {
  final PalmaConEnfermedad? palma;
  final String? nombreLote;
  final String? observaciones;
  final FormStatus status;
  const ErradicacionConCausa({
    this.palma,
    this.nombreLote,
    this.observaciones,
    this.status = FormStatus.noSubmitted,
  });

  ErradicacionConCausa copyWith({
    PalmaConEnfermedad? palma,
    String? nombreLote,
    String? observaciones,
    FormStatus? status,
  }) {
    return ErradicacionConCausa(
      palma: palma ?? this.palma,
      nombreLote: nombreLote ?? this.nombreLote,
      observaciones: observaciones ?? this.observaciones,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [palma, nombreLote, observaciones, status];
}

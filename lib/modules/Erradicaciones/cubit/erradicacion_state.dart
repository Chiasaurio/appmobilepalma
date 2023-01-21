part of 'erradicacion_cubit.dart';

abstract class ErradicacionState extends Equatable {
  const ErradicacionState(
      {this.nombreLote,
      this.lineaPalma,
      this.numeroPalma,
      this.tieneCausa,
      this.palma,
      this.status = FormStatus.noSubmitted,
      this.causa});
  final FormStatus status;
  final PalmaValidada? palma;
  final String? causa;
  final String? nombreLote;
  final int? lineaPalma;
  final int? numeroPalma;
  final bool? tieneCausa;

  copyWith({
    PalmaValidada? palma,
    FormStatus? status,
    String? causa,
    String? nombreLote,
    int? lineaPalma,
    int? numeroPalma,
  }) {}

  @override
  List<Object?> get props => [
        palma,
        status,
        causa,
        nombreLote,
        lineaPalma,
        numeroPalma,
      ];
}

class ErradicacionInitial extends ErradicacionState {}

class ErradicacionInfoState extends ErradicacionState {
  const ErradicacionInfoState({
    super.palma,
    super.status,
    super.causa,
    super.tieneCausa,
    required super.nombreLote,
    required super.lineaPalma,
    required super.numeroPalma,
  });
  @override
  ErradicacionInfoState copyWith({
    PalmaValidada? palma,
    FormStatus? status,
    String? causa,
    String? nombreLote,
    int? lineaPalma,
    bool? tieneCausa,
    int? numeroPalma,
  }) {
    return ErradicacionInfoState(
        palma: palma ?? this.palma,
        status: status ?? this.status,
        nombreLote: nombreLote ?? this.nombreLote,
        lineaPalma: lineaPalma ?? this.lineaPalma,
        numeroPalma: numeroPalma ?? this.numeroPalma,
        causa: causa ?? this.causa,
        tieneCausa: tieneCausa ?? this.tieneCausa);
  }

  @override
  List<Object?> get props =>
      [palma, status, nombreLote, lineaPalma, numeroPalma, causa, tieneCausa];
}

// class ErradicacionSinCausa extends ErradicacionState {
//   const ErradicacionSinCausa({
//     super.palma,
//     super.status,
//     super.causa,
//     super.nombreLote,
//     super.lineaPalma,
//     super.numeroPalma,
//   });

//   @override
//   ErradicacionSinCausa copyWith({
//     PalmaConEnfermedad? palma,
//     FormStatus? status,
//     String? causa,
//     String? nombreLote,
//     int? lineaPalma,
//     int? numeroPalma,
//   }) {
//     return ErradicacionSinCausa(
//         palma: palma ?? this.palma,
//         status: status ?? this.status,
//         causa: causa ?? this.causa,
//         nombreLote: nombreLote ?? this.nombreLote,
//         lineaPalma: lineaPalma ?? this.lineaPalma,
//         numeroPalma: numeroPalma ?? this.numeroPalma);
//   }

//   @override
//   List<Object?> get props => [
//         palma,
//         status,
//         causa,
//         nombreLote,
//         lineaPalma,
//         numeroPalma,
//       ];
// }

class ValidandoPalma extends ErradicacionState {}

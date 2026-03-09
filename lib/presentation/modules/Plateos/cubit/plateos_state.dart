part of 'plateos_cubit.dart';

class PlateosStateLoaded extends Equatable {
  final Plateo? plateo;
  final List<PlateoDiarioData>? plateosDiarios;
  final bool isLoaded;
  final FormStatus status;
  final String statusMsg;
  const PlateosStateLoaded({
    this.plateo,
    this.plateosDiarios,
    this.isLoaded = false,
    this.status = FormStatus.noSubmitted,
    this.statusMsg = '',
  });

  @override
  List<Object?> get props => [
        plateo,
        plateosDiarios,
        status,
        statusMsg,
        isLoaded,
      ];

  PlateosStateLoaded copyWith({
    Plateo? plateo,
    List<PlateoDiarioData>? plateosDiarios,
    bool? isLoaded,
    FormStatus? status,
    String? statusMsg,
  }) {
    return PlateosStateLoaded(
      plateo: plateo ?? this.plateo,
      plateosDiarios: plateosDiarios ?? this.plateosDiarios,
      isLoaded: isLoaded ?? this.isLoaded,
      status: status ?? this.status,
      statusMsg: statusMsg ?? this.statusMsg,
    );
  }
}

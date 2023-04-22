part of 'cosecha_cubit.dart';

// @immutable
// abstract class CosechaState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class CosechaInitial extends CosechaState {}

class CosechaStateLoaded extends Equatable {
  final Cosecha? cosecha;
  final List<CosechaDiariaData>? cosechasDiarias;
  final bool isLoaded;
  final FormStatus status;
  final String statusMsg;
  const CosechaStateLoaded({
    this.cosecha,
    this.cosechasDiarias,
    this.isLoaded = false,
    this.status = FormStatus.noSubmitted,
    this.statusMsg = '',
  });

  @override
  List<Object?> get props => [
        cosecha,
        cosechasDiarias,
        status,
        statusMsg,
        isLoaded,
      ];

  CosechaStateLoaded copyWith({
    Cosecha? cosecha,
    List<CosechaDiariaData>? cosechasDiarias,
    bool? isLoaded,
    FormStatus? status,
    String? statusMsg,
  }) {
    return CosechaStateLoaded(
      cosecha: cosecha ?? this.cosecha,
      cosechasDiarias: cosechasDiarias ?? this.cosechasDiarias,
      isLoaded: isLoaded ?? this.isLoaded,
      status: status ?? this.status,
      statusMsg: statusMsg ?? this.statusMsg,
    );
  }
}

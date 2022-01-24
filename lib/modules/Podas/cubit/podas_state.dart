part of 'podas_cubit.dart';

class PodasStateLoaded extends Equatable {
  final Poda? poda;
  final List<PodaDiariaData>? podasDiarias;
  final bool isLoaded;
  final FormStatus status;
  final String statusMsg;
  const PodasStateLoaded({
    this.poda,
    this.podasDiarias,
    this.isLoaded = false,
    this.status = FormStatus.noSubmitted,
    this.statusMsg = '',
  });

  @override
  List<Object?> get props => [
        poda,
        podasDiarias,
        status,
        statusMsg,
        isLoaded,
      ];

  PodasStateLoaded copyWith({
    Poda? poda,
    List<PodaDiariaData>? podasDiarias,
    bool? isLoaded,
    FormStatus? status,
    String? statusMsg,
  }) {
    return PodasStateLoaded(
      poda: poda ?? this.poda,
      podasDiarias: podasDiarias ?? this.podasDiarias,
      isLoaded: isLoaded ?? this.isLoaded,
      status: status ?? this.status,
      statusMsg: statusMsg ?? this.statusMsg,
    );
  }
}

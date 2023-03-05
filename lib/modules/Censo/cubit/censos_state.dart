part of 'censos_cubit.dart';

class CensosState extends Equatable {
  const CensosState({
    this.censo,
    this.censos,
    this.status = FormStatus.noSubmitted,
  });
  final List<CensoData>? censos;
  final CensoData? censo;
  final FormStatus status;

  @override
  List<Object?> get props => [censos, censo];

  CensosState copyWith({
    FormStatus? status,
    List<CensoData>? censos,
    CensoData? censo,
  }) {
    return CensosState(
      status: status ?? this.status,
      censos: censos ?? this.censos,
      censo: censo ?? this.censo,
    );
  }
}

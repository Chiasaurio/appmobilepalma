part of 'censos_cubit.dart';

enum CensoStatus { initial, loading, loaded, selected, success, error }

class CensosState extends Equatable {
  const CensosState({
    this.censo,
    this.filtro,
    this.censos,
    this.status = CensoStatus.initial,
  });
  final List<CensoData>? censos;
  final CensoData? censo;
  final CensoStatus status;
  final String? filtro;

  @override
  List<Object?> get props => [censos, censo, status, filtro];

  CensosState copyWith({
    String? filtro,
    CensoStatus? status,
    List<CensoData>? censos,
    CensoData? censo,
  }) {
    return CensosState(
      filtro: filtro ?? this.filtro,
      status: status ?? this.status,
      censos: censos ?? this.censos,
      censo: censo ?? this.censo,
    );
  }
}

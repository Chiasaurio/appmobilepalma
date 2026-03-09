part of 'censo_productivo_cubit.dart';

class CensoProductivoInitial extends Equatable {
  final List<CensoProductivoData>? censos;

  const CensoProductivoInitial({this.censos});

  @override
  List<Object?> get props => [censos];

  CensoProductivoInitial copyWith({List<CensoProductivoData>? censos}) {
    return CensoProductivoInitial(censos: censos ?? this.censos);
  }
}

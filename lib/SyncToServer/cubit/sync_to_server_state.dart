part of 'sync_to_server_cubit.dart';

class SyncToServerState extends Equatable {
  final List<CosechaConCosechasDiarias>? cosechasConDiariasPendientes;
  final List<PodasConPodasDiarias>? podasConDiariasPendientes;
  final List<PlateoConPlateosDiarias>? plateosConDiariasPendientes;
  final bool loaded;
  const SyncToServerState({
    this.loaded = false,
    this.cosechasConDiariasPendientes,
    this.podasConDiariasPendientes,
    this.plateosConDiariasPendientes,
  });
  SyncToServerState copyWith({
    List<PodasConPodasDiarias>? podasConDiariasPendientes,
    List<PlateoConPlateosDiarias>? plateosConDiariasPendientes,
    List<CosechaConCosechasDiarias>? cosechasConDiariasPendientes,
    bool? loaded,
  }) {
    return SyncToServerState(
      podasConDiariasPendientes:
          podasConDiariasPendientes ?? this.podasConDiariasPendientes,
      plateosConDiariasPendientes:
          plateosConDiariasPendientes ?? this.plateosConDiariasPendientes,
      cosechasConDiariasPendientes:
          cosechasConDiariasPendientes ?? this.cosechasConDiariasPendientes,
      loaded: loaded ?? this.loaded,
    );
  }

  @override
  List<Object?> get props => [
        cosechasConDiariasPendientes,
        podasConDiariasPendientes,
        plateosConDiariasPendientes,
        loaded,
      ];
}

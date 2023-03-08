part of 'sync_to_server_cubit.dart';

class SyncToServerState extends Equatable {
  final List<CosechaConCosechasDiarias>? cosechasConDiariasPendientes;
  final List<PodasConPodasDiarias>? podasConDiariasPendientes;
  final List<PlateoConPlateosDiarias>? plateosConDiariasPendientes;
  final List<Palma>? palmasPendientes;
  final List<RegistroEnfermedadData>? enfermedadesPendientes;
  final List<RegistroTratamientoData>? tratamientosPendientes;
  final List<ErradicacionData>? erradicacionesPendientes;
  final List<CensoData>? censosPendientes;
  final List<Aplicacione>? fumigacionesPendientes;
  final bool loaded;
  final FormStatus status;
  final SyncStatus cosechasStatus;
  final SyncStatus podasStatus;
  final SyncStatus plateosStatus;
  final SyncStatus palmasStatus;
  final SyncStatus enfermedadesStatus;
  final SyncStatus tratamientosStatus;
  final SyncStatus erradicacionesStatus;
  final SyncStatus censosStatus;
  final SyncStatus fumigacionesStatus;

  const SyncToServerState({
    this.loaded = false,
    this.status = FormStatus.noSubmitted,
    this.cosechasConDiariasPendientes,
    this.podasConDiariasPendientes,
    this.plateosConDiariasPendientes,
    this.enfermedadesPendientes,
    this.tratamientosPendientes,
    this.erradicacionesPendientes,
    this.censosPendientes,
    this.fumigacionesPendientes,
    this.palmasPendientes,
    this.cosechasStatus = SyncStatus.initial,
    this.podasStatus = SyncStatus.initial,
    this.plateosStatus = SyncStatus.initial,
    this.palmasStatus = SyncStatus.initial,
    this.enfermedadesStatus = SyncStatus.initial,
    this.tratamientosStatus = SyncStatus.initial,
    this.erradicacionesStatus = SyncStatus.initial,
    this.censosStatus = SyncStatus.initial,
    this.fumigacionesStatus = SyncStatus.initial,
  });
  SyncToServerState copyWith({
    List<PodasConPodasDiarias>? podasConDiariasPendientes,
    List<PlateoConPlateosDiarias>? plateosConDiariasPendientes,
    List<CosechaConCosechasDiarias>? cosechasConDiariasPendientes,
    List<Palma>? palmasPendientes,
    bool? loaded,
    FormStatus? status,
    List<RegistroEnfermedadData>? enfermedadesPendientes,
    List<RegistroTratamientoData>? tratamientosPendientes,
    List<ErradicacionData>? erradicacionesPendientes,
    List<CensoData>? censosPendientes,
    List<Aplicacione>? fumigacionesPendientes,
    SyncStatus? cosechasStatus,
    SyncStatus? podasStatus,
    SyncStatus? plateosStatus,
    SyncStatus? palmasStatus,
    SyncStatus? enfermedadesStatus,
    SyncStatus? tratamientosStatus,
    SyncStatus? erradicacionesStatus,
    SyncStatus? censosStatus,
    SyncStatus? fumigacionesStatus,
  }) {
    return SyncToServerState(
      podasConDiariasPendientes:
          podasConDiariasPendientes ?? this.podasConDiariasPendientes,
      plateosConDiariasPendientes:
          plateosConDiariasPendientes ?? this.plateosConDiariasPendientes,
      cosechasConDiariasPendientes:
          cosechasConDiariasPendientes ?? this.cosechasConDiariasPendientes,
      loaded: loaded ?? this.loaded,
      status: status ?? this.status,
      censosPendientes: censosPendientes ?? this.censosPendientes,
      fumigacionesPendientes:
          fumigacionesPendientes ?? this.fumigacionesPendientes,
      palmasPendientes: palmasPendientes ?? this.palmasPendientes,
      erradicacionesPendientes:
          erradicacionesPendientes ?? this.erradicacionesPendientes,
      tratamientosPendientes:
          tratamientosPendientes ?? this.tratamientosPendientes,
      enfermedadesPendientes:
          enfermedadesPendientes ?? this.enfermedadesPendientes,
      cosechasStatus: cosechasStatus ?? this.cosechasStatus,
      podasStatus: podasStatus ?? this.podasStatus,
      plateosStatus: plateosStatus ?? this.plateosStatus,
      palmasStatus: palmasStatus ?? this.palmasStatus,
      enfermedadesStatus: enfermedadesStatus ?? this.enfermedadesStatus,
      tratamientosStatus: tratamientosStatus ?? this.tratamientosStatus,
      erradicacionesStatus: erradicacionesStatus ?? this.erradicacionesStatus,
      censosStatus: censosStatus ?? this.censosStatus,
      fumigacionesStatus: fumigacionesStatus ?? this.fumigacionesStatus,
    );
  }

  @override
  List<Object?> get props => [
        cosechasConDiariasPendientes,
        podasConDiariasPendientes,
        plateosConDiariasPendientes,
        erradicacionesPendientes,
        palmasPendientes,
        enfermedadesPendientes,
        tratamientosPendientes,
        censosPendientes,
        fumigacionesPendientes,
        loaded,
        status,
        cosechasStatus,
        podasStatus,
        plateosStatus,
        palmasStatus,
        enfermedadesStatus,
        tratamientosStatus,
        erradicacionesStatus,
        censosStatus,
        fumigacionesStatus,
      ];
}

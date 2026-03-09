part of 'sync_to_server_cubit.dart';

class SyncToServerState extends Equatable {
  final List<CosechaConCosechasDiarias>? cosechasConDiariasPendientes;
  final List<PodasConPodasDiarias>? podasConDiariasPendientes;
  final List<PlateoConPlateosDiarias>? plateosConDiariasPendientes;
  final List<FertilizacionConFertilizacionesDiarias>?
      fertilizacionesConDiariasPendientes;
  final List<Palma>? palmasPendientes;
  final List<RegistroEnfermedadConImagenes>? enfermedadesPendientes;
  final List<RegistroTratamientoData>? tratamientosPendientes;
  final List<ErradicacionData>? erradicacionesPendientes;
  final List<CensoConEtapas>? censosPendientes;
  final List<Aplicacione>? fumigacionesPendientes;
  final List<Viaje>? viajesPendientes;
  final List<PrecipitacionData>? precipitacionesPendientes;
  final List<CensoProductivoData>? censosProductivosPendientes;
  final bool loaded;
  final FormStatus status;
  final SyncStatus cosechasStatus;
  final SyncStatus podasStatus;
  final SyncStatus plateosStatus;
  final SyncStatus fertilizacionesStatus;
  final SyncStatus palmasStatus;
  final SyncStatus enfermedadesStatus;
  final SyncStatus tratamientosStatus;
  final SyncStatus erradicacionesStatus;
  final SyncStatus censosStatus;
  final SyncStatus fumigacionesStatus;
  final SyncStatus viajesStatus;
  final SyncStatus precipitacionesStatus;
  final SyncStatus censosProductivosStatus;

  const SyncToServerState({
    this.loaded = false,
    this.status = FormStatus.noSubmitted,
    this.cosechasConDiariasPendientes,
    this.podasConDiariasPendientes,
    this.plateosConDiariasPendientes,
    this.fertilizacionesConDiariasPendientes,
    this.enfermedadesPendientes,
    this.tratamientosPendientes,
    this.erradicacionesPendientes,
    this.censosPendientes,
    this.fumigacionesPendientes,
    this.palmasPendientes,
    this.viajesPendientes,
    this.precipitacionesPendientes,
    this.censosProductivosPendientes,
    this.cosechasStatus = SyncStatus.initial,
    this.podasStatus = SyncStatus.initial,
    this.plateosStatus = SyncStatus.initial,
    this.fertilizacionesStatus = SyncStatus.initial,
    this.palmasStatus = SyncStatus.initial,
    this.enfermedadesStatus = SyncStatus.initial,
    this.tratamientosStatus = SyncStatus.initial,
    this.erradicacionesStatus = SyncStatus.initial,
    this.censosStatus = SyncStatus.initial,
    this.fumigacionesStatus = SyncStatus.initial,
    this.viajesStatus = SyncStatus.initial,
    this.precipitacionesStatus = SyncStatus.initial,
    this.censosProductivosStatus = SyncStatus.initial,
  });
  SyncToServerState copyWith({
    List<PodasConPodasDiarias>? podasConDiariasPendientes,
    List<PlateoConPlateosDiarias>? plateosConDiariasPendientes,
    List<CosechaConCosechasDiarias>? cosechasConDiariasPendientes,
    List<FertilizacionConFertilizacionesDiarias>?
        fertilizacionesConDiariasPendientes,
    List<Palma>? palmasPendientes,
    bool? loaded,
    FormStatus? status,
    List<RegistroEnfermedadConImagenes>? enfermedadesPendientes,
    List<RegistroTratamientoData>? tratamientosPendientes,
    List<ErradicacionData>? erradicacionesPendientes,
    List<CensoConEtapas>? censosPendientes,
    List<Aplicacione>? fumigacionesPendientes,
    List<Viaje>? viajesPendientes,
    List<PrecipitacionData>? precipitacionesPendientes,
    List<CensoProductivoData>? censosProductivosPendientes,
    SyncStatus? cosechasStatus,
    SyncStatus? podasStatus,
    SyncStatus? plateosStatus,
    SyncStatus? fertilizacionesStatus,
    SyncStatus? palmasStatus,
    SyncStatus? enfermedadesStatus,
    SyncStatus? tratamientosStatus,
    SyncStatus? erradicacionesStatus,
    SyncStatus? censosStatus,
    SyncStatus? fumigacionesStatus,
    SyncStatus? viajesStatus,
    SyncStatus? precipitacionesStatus,
    SyncStatus? censosProductivosStatus,
  }) {
    return SyncToServerState(
      podasConDiariasPendientes:
          podasConDiariasPendientes ?? this.podasConDiariasPendientes,
      plateosConDiariasPendientes:
          plateosConDiariasPendientes ?? this.plateosConDiariasPendientes,
      cosechasConDiariasPendientes:
          cosechasConDiariasPendientes ?? this.cosechasConDiariasPendientes,
      fertilizacionesConDiariasPendientes:
          fertilizacionesConDiariasPendientes ??
              this.fertilizacionesConDiariasPendientes,
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
      viajesPendientes: viajesPendientes ?? this.viajesPendientes,
      precipitacionesPendientes:
          precipitacionesPendientes ?? this.precipitacionesPendientes,
      censosProductivosPendientes:
          censosProductivosPendientes ?? this.censosProductivosPendientes,
      cosechasStatus: cosechasStatus ?? this.cosechasStatus,
      podasStatus: podasStatus ?? this.podasStatus,
      plateosStatus: plateosStatus ?? this.plateosStatus,
      fertilizacionesStatus:
          fertilizacionesStatus ?? this.fertilizacionesStatus,
      palmasStatus: palmasStatus ?? this.palmasStatus,
      enfermedadesStatus: enfermedadesStatus ?? this.enfermedadesStatus,
      tratamientosStatus: tratamientosStatus ?? this.tratamientosStatus,
      erradicacionesStatus: erradicacionesStatus ?? this.erradicacionesStatus,
      censosStatus: censosStatus ?? this.censosStatus,
      fumigacionesStatus: fumigacionesStatus ?? this.fumigacionesStatus,
      viajesStatus: viajesStatus ?? this.viajesStatus,
      precipitacionesStatus:
          precipitacionesStatus ?? this.precipitacionesStatus,
      censosProductivosStatus:
          censosProductivosStatus ?? this.censosProductivosStatus,
    );
  }

  @override
  List<Object?> get props => [
        cosechasConDiariasPendientes,
        podasConDiariasPendientes,
        plateosConDiariasPendientes,
        fertilizacionesConDiariasPendientes,
        erradicacionesPendientes,
        palmasPendientes,
        enfermedadesPendientes,
        tratamientosPendientes,
        censosPendientes,
        fumigacionesPendientes,
        viajesPendientes,
        precipitacionesPendientes,
        censosProductivosPendientes,
        loaded,
        status,
        cosechasStatus,
        podasStatus,
        plateosStatus,
        fertilizacionesStatus,
        palmasStatus,
        enfermedadesStatus,
        tratamientosStatus,
        erradicacionesStatus,
        censosStatus,
        fumigacionesStatus,
        viajesStatus,
        precipitacionesStatus,
        censosProductivosStatus
      ];
}

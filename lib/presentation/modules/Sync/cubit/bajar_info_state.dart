part of 'bajar_info_cubit.dart';

class BajarInfoState extends Equatable {
  const BajarInfoState(
      {this.estadoLote = SyncStatus.initial,
      this.estadoEnfermedad = SyncStatus.initial,
      this.estadoPlaga = SyncStatus.initial,
      this.estadoAgroquimico = SyncStatus.initial,
      this.loteFechaUltimaActualizacion,
      this.plagaFechaUltimaActualizacion,
      this.enfermedadFechaUltimaActualizacion,
      this.agroquimicoFechaUltimaActualizacion});

  final SyncStatus estadoLote;
  final SyncStatus estadoEnfermedad;
  final SyncStatus estadoPlaga;
  final SyncStatus estadoAgroquimico;
  final String? loteFechaUltimaActualizacion;
  final String? plagaFechaUltimaActualizacion;
  final String? enfermedadFechaUltimaActualizacion;
  final String? agroquimicoFechaUltimaActualizacion;

  @override
  List<Object?> get props => [
        estadoLote,
        estadoEnfermedad,
        estadoPlaga,
        estadoAgroquimico,
        loteFechaUltimaActualizacion,
        plagaFechaUltimaActualizacion,
        enfermedadFechaUltimaActualizacion,
        agroquimicoFechaUltimaActualizacion
      ];

  BajarInfoState copyWith({
    SyncStatus? estadoLote,
    SyncStatus? estadoEnfermedad,
    SyncStatus? estadoPlaga,
    SyncStatus? estadoAgroquimico,
    String? loteFechaUltimaActualizacion,
    String? plagaFechaUltimaActualizacion,
    String? enfermedadFechaUltimaActualizacion,
    String? agroquimicoFechaUltimaActualizacion,
  }) {
    return BajarInfoState(
      estadoLote: estadoLote ?? this.estadoLote,
      estadoEnfermedad: estadoEnfermedad ?? this.estadoEnfermedad,
      estadoPlaga: estadoPlaga ?? this.estadoPlaga,
      estadoAgroquimico: estadoAgroquimico ?? this.estadoAgroquimico,
      loteFechaUltimaActualizacion:
          loteFechaUltimaActualizacion ?? this.loteFechaUltimaActualizacion,
      plagaFechaUltimaActualizacion:
          plagaFechaUltimaActualizacion ?? this.plagaFechaUltimaActualizacion,
      enfermedadFechaUltimaActualizacion: enfermedadFechaUltimaActualizacion ??
          this.enfermedadFechaUltimaActualizacion,
      agroquimicoFechaUltimaActualizacion:
          agroquimicoFechaUltimaActualizacion ??
              this.agroquimicoFechaUltimaActualizacion,
    );
  }
}

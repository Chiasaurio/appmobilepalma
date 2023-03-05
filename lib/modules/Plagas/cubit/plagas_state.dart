part of 'plagas_cubit.dart';

class PlagasState extends Equatable {
  final FormStatus status;
  final List<PlagaConEtapas>? plagas;
  final PlagaConEtapas? plagaSeleccionada;
  final List<EtapasPlagaData> etapasSeleccionada;
  final String? observaciones;
  final String? nombreLote;
  final int? limite1;
  final int? limite2;
  final bool otraplaga;
  final bool presenciasector;
  final bool presencialote;

  const PlagasState({
    this.plagas,
    this.plagaSeleccionada,
    this.etapasSeleccionada = const [],
    this.status = FormStatus.noSubmitted,
    this.nombreLote,
    this.limite1,
    this.limite2,
    this.otraplaga = false,
    this.observaciones,
    this.presenciasector = false,
    this.presencialote = false,
  });
  PlagasState copyWith({
    List<PlagaConEtapas>? plagas,
    PlagaConEtapas? plagaSeleccionada,
    List<EtapasPlagaData>? etapasSeleccionada,
    FormStatus? status,
    String? observaciones,
    String? nombreLote,
    int? limite1,
    int? limite2,
    bool? otraplaga,
    bool? presenciasector,
    bool? presencialote,
  }) {
    return PlagasState(
        plagas: plagas ?? this.plagas,
        status: status ?? this.status,
        etapasSeleccionada: etapasSeleccionada ?? this.etapasSeleccionada,
        plagaSeleccionada: plagaSeleccionada ?? this.plagaSeleccionada,
        nombreLote: nombreLote ?? this.nombreLote,
        limite1: limite1 ?? this.limite1,
        limite2: limite2 ?? this.limite2,
        observaciones: observaciones ?? this.observaciones,
        presenciasector: presenciasector ?? this.presenciasector,
        presencialote: presencialote ?? this.presencialote,
        otraplaga: otraplaga ?? this.otraplaga);
  }

  @override
  List<Object?> get props => [
        plagas,
        plagaSeleccionada,
        etapasSeleccionada,
        status,
        nombreLote,
        limite1,
        limite2,
        observaciones,
        otraplaga,
        presenciasector,
        presencialote
      ];
}

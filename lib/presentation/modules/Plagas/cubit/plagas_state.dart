part of 'plagas_cubit.dart';

class PlagasState extends Equatable {
  final FormStatus status;
  final List<PlagaConEtapas>? plagas;
  final PlagaConEtapas? plagaSeleccionada;
  final List<EtapaIndividuosModel> etapasSeleccionada;
  final String? observaciones;
  final String? nombreLote;
  final String? orientacion;
  final int? numero;
  final int? linea;
  final int? numeroIndividuos;
  final List<XFile>? imagenes;
  // final int? limite1;
  // final int? limite2;
  final bool otraplaga;
  // final bool presenciasector;
  // final bool presencialote;

  const PlagasState({
    this.imagenes,
    this.plagas,
    this.plagaSeleccionada,
    this.etapasSeleccionada = const [],
    this.status = FormStatus.noSubmitted,
    this.nombreLote,
    // this.limite1,
    // this.limite2,
    this.orientacion,
    this.numero,
    this.linea,
    this.numeroIndividuos,
    this.otraplaga = false,
    this.observaciones,
    // this.presenciasector = false,
    // this.presencialote = false,
  });
  PlagasState copyWith({
    List<XFile>? imagenes,
    List<PlagaConEtapas>? plagas,
    PlagaConEtapas? plagaSeleccionada,
    List<EtapaIndividuosModel>? etapasSeleccionada,
    FormStatus? status,
    String? observaciones,
    String? nombreLote,
    String? orientacion,
    int? numero,
    int? linea,
    int? numeroIndividuos,
    // int? limite1,
    // int? limite2,
    bool? otraplaga,
    // bool? presenciasector,
    // bool? presencialote,
  }) {
    return PlagasState(
        imagenes: imagenes ?? this.imagenes,
        plagas: plagas ?? this.plagas,
        status: status ?? this.status,
        etapasSeleccionada: etapasSeleccionada ?? this.etapasSeleccionada,
        plagaSeleccionada: plagaSeleccionada ?? this.plagaSeleccionada,
        nombreLote: nombreLote ?? this.nombreLote,
        orientacion: orientacion ?? this.orientacion,
        numero: numero ?? this.numero,
        linea: linea ?? this.linea,
        numeroIndividuos: numeroIndividuos ?? this.numeroIndividuos,
        // limite1: limite1 ?? this.limite1,
        // limite2: limite2 ?? this.limite2,
        observaciones: observaciones ?? this.observaciones,
        // presenciasector: presenciasector ?? this.presenciasector,
        // presencialote: presencialote ?? this.presencialote,
        otraplaga: otraplaga ?? this.otraplaga);
  }

  @override
  List<Object?> get props => [
        imagenes,
        plagas,
        plagaSeleccionada,
        etapasSeleccionada,
        status,
        nombreLote,
        orientacion,
        numero,
        linea,
        numeroIndividuos,
        // limite1,
        // limite2,
        observaciones,
        otraplaga,
        // presenciasector,
        // presencialote
      ];
}

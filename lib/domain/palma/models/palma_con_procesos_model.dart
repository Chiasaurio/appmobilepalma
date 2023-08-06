import 'dart:typed_data';

import 'package:equatable/equatable.dart';

import '../../../data/moor/moor_database.dart';

class PalmaConProcesos extends Equatable {
  final Palma palma;
  final List<RegistroEnfermedadDatos> registroenfermedaddatos;

  const PalmaConProcesos({
    required this.palma,
    required this.registroenfermedaddatos,
  });
  @override
  List<Object?> get props => [palma, registroenfermedaddatos];
}

class RegistroEnfermedadDatos extends Equatable {
  final RegistroEnfermedadData registroenfermedad;
  final Enfermedade? enfermedad;
  final Etapa? etapa;
  final RegistroTratamientoData? registrotratamiento;
  final bool isExpanded;
  final List<String> imagenes;

  const RegistroEnfermedadDatos({
    required this.registroenfermedad,
    required this.etapa,
    required this.enfermedad,
    required this.registrotratamiento,
    this.isExpanded = false,
    this.imagenes = const [],
  });

  RegistroEnfermedadDatos changeExpanded({bool? expanded}) {
    return RegistroEnfermedadDatos(
        imagenes: imagenes,
        registroenfermedad: registroenfermedad,
        etapa: etapa,
        enfermedad: enfermedad,
        registrotratamiento: registrotratamiento,
        isExpanded: expanded ?? isExpanded);
  }

  @override
  List<Object?> get props => [
        registroenfermedad,
        etapa,
        enfermedad,
        registrotratamiento,
        isExpanded,
        imagenes
      ];
}

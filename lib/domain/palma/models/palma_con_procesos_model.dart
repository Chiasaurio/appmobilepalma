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

  const RegistroEnfermedadDatos({
    required this.registroenfermedad,
    required this.etapa,
    required this.enfermedad,
    required this.registrotratamiento,
    this.isExpanded = false,
  });

  RegistroEnfermedadDatos changeExpanded({bool? expanded}) {
    return RegistroEnfermedadDatos(
        registroenfermedad: registroenfermedad,
        etapa: etapa,
        enfermedad: enfermedad,
        registrotratamiento: registrotratamiento,
        isExpanded: expanded ?? isExpanded);
  }

  @override
  List<Object?> get props =>
      [registroenfermedad, etapa, enfermedad, registrotratamiento, isExpanded];
}

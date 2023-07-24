import 'package:flutter/material.dart';

class EstadosPalma {
  static const pendientePorTratar = 'Pendiente por tratar';
  static const pendientePorErradicar = 'Pendiente por erradicar';
  static const enTratamiento = 'En tratamiento';
  static const reincidente = 'Reincidente';
  static const erradicada = 'Erradicada';
  static const alta = 'Alta';
  static const sana = 'Sana';

  static Map<String, Color> etiquetacolor = {
    EstadosPalma.sana: Colors.green,
    EstadosPalma.enTratamiento: Colors.orange,
    EstadosPalma.alta: Colors.green,
    EstadosPalma.pendientePorErradicar: Colors.red,
    EstadosPalma.pendientePorTratar: Colors.yellow,
  };
}

class EstadosPlaga {
  static const pendientePorFumigar = 'Pendiente por fumigar';
  static const fumigado = 'Fumigado';
  static const eliminado = 'Eliminado';
}

class ProcedimientosEnfermedad {
  static const erradicacion = 'Erradicación';
}

const String nombreFinca = 'FINCA CAMPOALEGRE';

const kPrimaryColor = Color(0xFF2D6A4F);
const kLightGreen = Color(0xFF95D5B2);
const kLightGreen2 = Color.fromARGB(255, 196, 255, 222);
const kBackgroundColor = Color.fromARGB(248, 245, 245, 245);
const kYellowColor = Color.fromRGBO(255, 235, 59, 1);
const kRedColor = Color.fromARGB(255, 210, 20, 20);
const kpurpleColor = Color(0xff526BF6);
const kblueColor = Color(0xff67ACF2);
const kDefualtBlueColor = Colors.blue;

final tipoControl = ["Biologico", "Químico"];
final ubicacionPlaga = ["lote", "sector"];

List<String> orientaciones = ['NORTE-SUR', 'SUR-NORTE', 'ORIENTE-OCCIDENTE'];

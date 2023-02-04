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
  static const eliminado = 'En tratamiento';
}

const String nombreFinca = 'FINCA CAMPOALEGRE';

const kPrimaryColor = Color(0xFF2D6A4F);
const kBackgroundColor = Color.fromARGB(168, 245, 245, 245);
const kYellowColor = Color.fromRGBO(255, 235, 59, 1);
const kRedColor = Color.fromARGB(255, 210, 20, 20);

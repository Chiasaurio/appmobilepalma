import 'package:apppalma/constants.dart';
import 'package:apppalma/modules/Palma/PalmaDetail/registrospalma.dart';
import 'package:apppalma/modules/Palma/PalmaDetail/ui/components/card_palma.dart';
import 'package:apppalma/modules/Palma/PalmaDetail/ui/components/list_registro_enfermedades.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final PalmaConProcesos palmaConProcesos;

  const Body({Key? key, required this.palmaConProcesos}) : super(key: key);
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late Palma palma;

  late String nombrelote;
  late String ruta;

  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double separacion;
  late double margin;

  @override
  void initState() {
    palma = widget.palmaConProcesos.palma;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    nombrelote = palma.nombreLote;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.5;
    anchoCard = width * 0.9;
    margin = anchoCard * 0.04;

    return Container(
      margin: EdgeInsets.all(margin),
      child: detallesPalma(),
    );
  }

  Widget detallesPalma() {
    return crearContenido();
  }

  Widget crearContenido() {
    return Column(
      children: [
        CardPalma(palma: palma),
        RegistroEnfermedadesList(
            registros: widget.palmaConProcesos.registroenfermedaddatos)
      ],
    );
  }
}

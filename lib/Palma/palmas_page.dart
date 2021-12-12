import 'package:apppalma/components/appbar.dart';
import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

import 'cubit/palma_cubit.dart';

class PalmaPage extends StatefulWidget {
  @override
  _PalmaPageState createState() => _PalmaPageState();
}

class _PalmaPageState extends State<PalmaPage> {
  final palmaBloc = new PalmaCubit();
  var width;
  var height;
  var altoCard;
  var anchoCard;
  late String nombrelote;
  late String ruta;
  late Palma palmaseleccionada;

  @override
  Widget build(BuildContext context) {
    nombrelote = '';
    palmaBloc.obtenerPalmasLote(nombrelote);
    ruta = '';
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    altoCard = height * 0.4; //150,
    anchoCard = width * 0.7;

    return Scaffold(
        // appBar: AppBarWidget.getAppBar(nombrelote, ruta, context),
        body: Column(
      children: <Widget>[
        const HeaderApp(),
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: _buildMenu(context)),
      ],
    )

        // _mainContent(),
        );
  }

  Widget _buildMenu(context) {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado('Estado palmas leidas',
                '/lote/palmas/estadopalmas', Icons.art_track, context),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado('Registrar erradicacion',
                'lote/palmas/erradicacion', Icons.art_track, context),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(
                'Dar de alta', 'Aplicaciones', Icons.art_track, context),
          ],
        )
      ],
    );
  }

  Widget _crearBotonRedondeado(
      String opcion, String ruta, IconData icon, BuildContext context) {
    return GestureDetector(
      child: Container(
          height: height * 0.09,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(50.0)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(opcion,
                    style: TextStyle(color: Colors.black, fontSize: 18.0)),
                SizedBox(width: 30),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
              ])),
      onTap: () {
        Navigator.pushNamed(context, ruta, arguments: nombrelote);
      },
    );
  }
}

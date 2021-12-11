import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../size_config.dart';

class FincaPage extends StatelessWidget {
  final DateTime fecha =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  var width;
  var height;
  var altoCard;
  var anchoCard;
  var margin;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    altoCard = height * 0.6; //150,
    anchoCard = width * 0.7;
    margin = anchoCard * 0.04;

    // loteBloc.obtenerTodosLotesWithProcesos();

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(''),
      // ),
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: altoCard * 0.1),
                buildTitulo(),
                _buildMenu(context), // _menu2()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: FractionalOffset(0.0, 0.6),
      //         end: FractionalOffset(0.0, 12.0),
      //         colors: [
      //       Color.fromRGBO(52, 54, 101, 1.0),
      //       Color.fromRGBO(35, 37, 57, 1.0)
      //     ])),
    );

    final cajaRosa = Transform.rotate(
        angle: -5 * pi / 6.0,
        child: Container(
          height: altoCard * 2,
          width: altoCard,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            // gradient: LinearGradient(
            //     colors: [Color(0xFF2D6A4F), Color(0xFF2D6A4F)])
          ),
        ));

    return Stack(
      children: <Widget>[
        // gradiente,
        Positioned(
            top: -altoCard * 0.6, left: -altoCard * 0.15, child: cajaRosa)
      ],
    );
  }

  Widget buildTitulo() {
    return Container(
      margin: EdgeInsets.fromLTRB(margin, 0.0, margin, margin),
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child: Text(
                'Finca \nCampoalegre',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(anchoCard * 0.3, margin, 0.0, 0.0),
            child: Text(DateFormat('yMMMMEEEEd', 'es').format(fecha),
                style: TextStyle(color: Colors.white, fontSize: 15)),
          )
        ],
      ),
    );
  }

  Widget _buildMenu(context) {
    return Container(
        width: width * 0.8,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, altoCard * 0.2, 0.0, 0.0),
          child: Table(
            children: [
              TableRow(
                children: [
                  _crearBotonRedondeado2(
                      'Ver lotes', '/lotes', Icons.art_track, context),
                ],
              ),
              TableRow(
                children: [
                  _crearBotonRedondeado2(
                      'Viajes de fruto', 'viajes', Icons.art_track, context),
                ],
              ),
              // TableRow(
              //   children: [
              //     _crearBotonRedondeado2('Pluviometro', 'formularioejemplo',
              //         Icons.art_track, context),
              //   ],
              // ),
              TableRow(
                children: [
                  _crearBotonRedondeado2(
                      'Sincronizar', '/sincronizar', Icons.art_track, context),
                ],
              )
            ],
          ),
        ));
  }

  Widget _crearBotonRedondeado2(
      String opcion, String ruta, IconData icon, BuildContext context) {
    return GestureDetector(
      child: Container(
          height: height * 0.09,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xFF95D5B2),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 2, offset: Offset(0, 1))
              ]),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(opcion,
                    style:
                        const TextStyle(color: Colors.black, fontSize: 18.0)),
                const SizedBox(width: 30),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
              ])),
      onTap: () {
        Navigator.pushNamed(context, ruta);
      },
    );
  }

  // Widget _crearBotonRedondeado3(
  //     String opcion, String ruta, IconData icon, BuildContext context) {
  //   return GestureDetector(
  //     child: Container(
  //         height: height * 0.09,
  //         margin: EdgeInsets.all(10.0),
  //         decoration: BoxDecoration(
  //             shape: BoxShape.rectangle,
  //             color: Colors.blue,
  //             borderRadius: BorderRadius.circular(10.0),
  //             boxShadow: [
  //               BoxShadow(
  //                   color: Colors.lightBlue,
  //                   blurRadius: 1,
  //                   offset: Offset(0, 1))
  //             ]),
  //         child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               Text(opcion,
  //                   style: TextStyle(color: Colors.black, fontSize: 18.0)),
  //               SizedBox(width: 30),
  //               Padding(
  //                 padding: const EdgeInsets.only(right: 8.0),
  //                 child: Icon(
  //                   Icons.keyboard_arrow_right,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //             ])),
  //     onTap: () {
  //       Navigator.pushNamed(context, ruta);
  //     },
  //   );
  // }
}

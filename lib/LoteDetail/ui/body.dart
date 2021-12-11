import 'package:apppalma/components/appbar.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // final podaBloc = new PodasBloc();
  // final plateoBloc = new PlateosBloc();
  // final cosechaBloc = new CosechasBloc();

  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;
  String nombrelote = '';
  @override
  Widget build(BuildContext context) {
    // cosechaBloc.obtenerCosechaActiva(nombrelote);
    // podaBloc.obtenerPodaActiva(nombrelote);
    // plateoBloc.obtenerPlateoActivo(nombrelote);

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    altoCard = height * 0.4; //150,
    anchoCard = width * 0.7;
    margin = anchoCard * 0.04;

    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTitulo1(),
              _buildMenu(context),
              _buildTitulo2(),
              _buildMenu2(context)
            ],
          ),
        ),
      ],
    ));
  }

  Widget _buildTitulo1() {
    return Container(
      margin: EdgeInsets.all(margin),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "Gestión productiva",
              style: TextStyle(
                  color: Colors.black87.withOpacity(0.8),
                  fontSize: 35,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitulo2() {
    return Container(
      margin: EdgeInsets.all(margin),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "Gestión fitosanitaria",
              style: TextStyle(
                  color: Colors.black87.withOpacity(0.8),
                  fontSize: 35,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenu(context) {
    return Container(
        width: width * 0.6,
        child: Table(
          children: [
            TableRow(
              children: [
                _crearBotonRedondeado(
                    'Cosechas', 'lote/cosechas', Icons.art_track, context),
                _crearBotonRedondeado(
                    'Podas', 'lote/podas', Icons.art_track, context),
                // _crearBotonRedondeado('Fertilizacion','lote/fertilizaciones', Icons.art_track, context),
              ],
            ),
            TableRow(
              children: [
                _crearBotonRedondeado(
                    'Plateo', 'lote/plateos', Icons.art_track, context),
                _crearBotonRedondeado('Fertilizacion', 'lote/fertilizaciones',
                    Icons.art_track, context),
              ],
            )
          ],
        ));
  }

  Widget _buildMenu2(context) {
    return Container(
      width: width * 0.8,
      child: Table(
        children: [
          TableRow(
            children: [
              _crearBotonRedondeado2(
                  'Palmas', '/lote/palmas', Icons.art_track, context),
            ],
          ),
          TableRow(
            children: [
              _crearBotonRedondeado2(
                  'Censo', '/lote/censo', Icons.art_track, context),
            ],
          ),
          TableRow(
            children: [
              _crearBotonRedondeado2('Aplicaciones', '/lote/aplicaciones',
                  Icons.art_track, context),
            ],
          )
        ],
      ),
    );
  }

  Widget _crearBotonRedondeado(
      String opcion, String ruta, IconData icon, BuildContext context) {
    return GestureDetector(
      child: Container(
          height: altoCard * 0.25,
          width: anchoCard,
          margin: EdgeInsets.all(margin * 0.5),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(10.0),
              color: Colors.white,
              border: Border.all(
                color: Colors.green, //                   <--- border color
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[200]!,
                    blurRadius: 5,
                    offset: Offset(0, 7))
              ]),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Padding(
                //   padding: const EdgeInsets.only(right: 1.0),
                //   child: Icon( icon, color: Colors.black,),
                // ),
                Text(
                  opcion,
                  style: TextStyle(fontSize: 16),
                ),
              ])),
      onTap: () {
        print(nombrelote);
        Navigator.pushNamed(context, ruta, arguments: nombrelote);
      },
    );
  }

  Widget _crearBotonRedondeado2(
      String opcion, String ruta, IconData icon, BuildContext context) {
    return GestureDetector(
      child: Container(
          height: height * 0.09,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[200]!,
                    blurRadius: 5,
                    offset: Offset(0, 7))
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
        Navigator.pushNamed(context, ruta, arguments: nombrelote);
      },
    );
  }
}

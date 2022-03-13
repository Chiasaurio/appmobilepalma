import 'package:apppalma/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class AplicacionesPage extends StatefulWidget {
  final String routeName;

  const AplicacionesPage({Key? key, required this.routeName}) : super(key: key);
  @override
  _AplicacionesPageState createState() => _AplicacionesPageState();
}

class _AplicacionesPageState extends State<AplicacionesPage> {
  var width;
  var height;
  var altoCard;
  var anchoCard;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    altoCard = height * 0.4; //150,
    anchoCard = width * 0.7;

    return Scaffold(
        appBar: HeaderApp(ruta: widget.routeName),
        body: ListView(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                child: _buildMenu(context)),
          ],
        ));
  }

  Widget _buildMenu(context) {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado('Registrar tratamiento',
                '/lote/aplicaciones/palmasenfermas', Icons.art_track, context),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado('Registrar fumigación',
                '/lote/aplicaciones/fumigacion', Icons.art_track, context),
          ],
        ),
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
}

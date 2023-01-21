import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';

import 'cubit/palma_cubit.dart';

class PalmaPage extends StatefulWidget {
  final String routeName;

  const PalmaPage({Key? key, this.routeName = 'lote/palmas/palmadetalle'})
      : super(key: key);
  @override
  State<PalmaPage> createState() => _PalmaPageState();
}

class _PalmaPageState extends State<PalmaPage> {
  final palmaBloc = PalmaCubit();
  late double margin;
  late double anchoCard;
  late double altoCard;
  late double width;
  late double height;
  late String nombrelote;
  late String ruta;
  late Palma palmaseleccionada;
  @override
  void initState() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.4; //150,
    anchoCard = width;
    margin = anchoCard * 0.02;
    super.initState();
  }

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
        HeaderApp(
          ruta: widget.routeName,
        ),
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
                '/lote/palmas/erradicar', Icons.art_track, context),
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
          margin: const EdgeInsets.all(10.0),
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
        Navigator.pushNamed(context, ruta, arguments: nombrelote);
      },
    );
  }
}

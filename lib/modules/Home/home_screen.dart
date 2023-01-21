import 'package:apppalma/modules/Home/components/header_curvo_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../size_config.dart';

class FincaPage extends StatefulWidget {
  const FincaPage({super.key});

  @override
  State<FincaPage> createState() => _FincaPageState();
}

class _FincaPageState extends State<FincaPage> {
  final DateTime fecha =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  double? margin;
  double? anchoCard;
  double? altoCard;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height! * 0.4; //150,
    anchoCard = width;
    margin = anchoCard! * 0.02;
    SizeConfig().init(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          const HeaderCurvo(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: altoCard! * 0.1),
                buildTitulo(),
                _buildMenu(context), // _menu2()
              ],
            ),
          ),
          // ),
        ],
      ),
    );
  }

  Widget buildTitulo() {
    return Container(
      margin: EdgeInsets.fromLTRB(margin!, 0.0, margin!, margin!),
      child: Column(
        children: <Widget>[
          Row(children: const <Widget>[
            Expanded(
              child: Text(
                'Finca \nCampoalegre',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.fromLTRB(anchoCard! * 0.3, margin!, 0.0, 0.0),
            child: Text(DateFormat('yMMMMEEEEd', 'es').format(fecha),
                style: const TextStyle(color: Colors.white, fontSize: 15)),
          )
        ],
      ),
    );
  }

  Widget _buildMenu(context) {
    return SizedBox(
        width: width! * 0.8,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, altoCard! * 0.2, 0.0, 0.0),
          child: Column(
            children: [
              _crearBotonRedondeado2(
                  'Ver lotes', '/lotes', Icons.art_track, context),
              _crearBotonRedondeado2(
                  'Viajes de fruto', '/viajes', Icons.art_track, context),
              _crearBotonRedondeado2('Registrar precipitacion', '/viajes',
                  Icons.art_track, context),
              _crearBotonRedondeado2(
                  'Sincronizar', '/sincronizar', Icons.art_track, context),
              _crearBotonRedondeado2(
                  'Sincronizar dos', '/sinctoserver', Icons.art_track, context),
            ],
          ),
        ));
  }

  Widget _crearBotonRedondeado2(
      String opcion, String ruta, IconData icon, BuildContext context) {
    return GestureDetector(
      child: Container(
          height: height! * 0.09,
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
}

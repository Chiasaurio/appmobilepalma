import 'package:apppalma/modules/Censo/cubit/censos_cubit.dart';
import 'package:apppalma/components/appbar.dart';
import 'package:apppalma/components/toasts/toasts.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'dart:ui';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final f = DateFormat('yyyy-MM-dd');
  List<CensoData> censos = [];
  CensoData? censoseleccionado;
  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.4; //150,
    anchoCard = width * 0.7;
    margin = anchoCard * 0.04;

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [_buildMenu(context)],
          ),
        ));
  }

  void _opcionesBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: altoCard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // ListTile(
                //   contentPadding: EdgeInsets.all(10.0),
                //   // leading: Icon(Icons.storage),
                //   title: Text('Ver registros de cosecha',
                //       textAlign: TextAlign.center),
                //   // onTap: () => Navigator.pushNamed( context , 'lote/cosechas/registrocosechas',  arguments: cosecha),
                // ),
                Divider(),
                ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    // leading: Icon(Icons.save_alt),
                    title: Text(
                      'Dar de alta',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green[900],
                        fontSize: 20,
                      ),
                    ),
                    onTap: () => dardealta()),
                Divider(),
              ],
            ),
          );
        });
  }

  void dardealta() {
    if (censoseleccionado == null) return;
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmar dar de alta'),
            content: Text(
                'Esta seguro que desea dar de alta el censo de ${censoseleccionado!.nombrePlaga} en el sector ${censoseleccionado!.lineaLimite1} - ${censoseleccionado!.lineaLimite2} '),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No')),
              TextButton(
                  onPressed: () {
                    dardealtaCenso(context);
                  },
                  child: const Text('Si'))
            ],
          );
        });
  }

  Widget _buildMenu(context) {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado('Registrar enfermedad',
                '/lote/censo/enfermedad', Icons.art_track, context),
          ],
        ),
        TableRow(
          children: [
            _crearBotonRedondeado('Registrar tratamiento',
                '/lote/aplicaciones/palmasenfermas', Icons.art_track, context),
          ],
        ),

        // TableRow(
        //   children:[
        //     _crearBotonRedondeado('Registrar hongo','censo/registrarhongo', Icons.art_track, context),
        //   ] ,
        // )
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
                    style: TextStyle(color: Colors.black, fontSize: 18.0)),
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
        Navigator.pushNamed(
          context,
          ruta,
        );
      },
    );
  }

  void dardealtaCenso(BuildContext context) async {
    try {
      BlocProvider.of<CensosCubit>(context).daraltaCenso(censoseleccionado!);
      Navigator.of(context).popUntil(ModalRoute.withName('lote/censo'));
      registroExitosoToast();
    } catch (e) {
      Navigator.of(context).popUntil(ModalRoute.withName('lote/censo'));
      registroFallidoToast(e.toString());
    }
  }
}

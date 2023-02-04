import 'package:flutter/material.dart';

import '../components/form_datos_viaje.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // DateTime fechaviaje =
  //     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  int totalkilos = 0;
  late double margin;
  late double anchoCard;
  late double altoCard;
  late double width;
  late double height;
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
    // cosechaBloc.obtenerCosechasFinalizadas();

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        FormDatosViaje(formKey: formKey)

        // buildDatosViaje(context),
        // SizedBox(height: altoCard*0.1),
        // buildFinalizarViajeBoton(context),
      ]),
    );
  }

//

}

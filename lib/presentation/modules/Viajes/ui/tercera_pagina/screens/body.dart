import 'package:apppalma/presentation/components/widgets/header_gradient.dart';
import 'package:flutter/material.dart';

import '../components/form_datos_viaje.dart';

class Body extends StatefulWidget {
  final String routeName;
  const Body({super.key, required this.routeName});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        HeaderGradient(title: "Registrar nuevo viaje", ruta: widget.routeName),
        FormDatosViaje(formKey: formKey)
      ]),
    );
  }

//
}

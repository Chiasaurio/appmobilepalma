import 'package:flutter/material.dart';

import 'fecha_widget.dart';
import 'hora_carga_widget.dart';
import 'hora_salida_widget.dart';

class FormDatosViaje extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const FormDatosViaje({Key? key, required this.formKey}) : super(key: key);

  @override
  State<FormDatosViaje> createState() => _FormDatosViajeState();
}

class _FormDatosViajeState extends State<FormDatosViaje> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: Form(
          key: widget.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const FechaViajeWidget(),
              const SizedBox(
                height: 30,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                          'Por favor ajuste las horas de carga y de salida.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18, /*fontWeight: FontWeight.bold*/
                          )),
                    ),
                  ]),
              const SizedBox(
                height: 30,
              ),
              const HoraCarga(),
              const SizedBox(
                height: 20,
              ),
              const HoraSalida(),
            ],
          )),
    );
  }
}

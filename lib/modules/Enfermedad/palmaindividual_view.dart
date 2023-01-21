import 'package:apppalma/modules/Enfermedad/enfermedad_form.dart';
import 'package:apppalma/modules/Palma/cubit/palma_cubit.dart';
import 'package:flutter/material.dart';

import 'package:apppalma/utils/utils.dart' as utils;

class PalmaIndividualView extends StatefulWidget {
  final String nombreLote;
  const PalmaIndividualView({Key? key, required this.nombreLote})
      : super(key: key);
  @override
  State<PalmaIndividualView> createState() => _PalmaIndividualViewState();
}

class _PalmaIndividualViewState extends State<PalmaIndividualView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late double margin;
  late double width;
  late double height;
  int? lineapalma;
  int? numeropalma;
  String? nombrelote;
  String? orientacion;
  List<String> orientaciones = ['NORTE-SUR', 'SUR-NORTE', 'ORIENTE-OCCIDENTE'];
  @override
  void initState() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    margin = width * 0.04;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        buildIngresarDatos(context),
        SizedBox(height: height * 0.1),
        buildContinuar(context)
      ],
    ));
  }

  Widget buildIngresarDatos(context) {
    return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: height * 0.0009),
            buildLineaPalma(),
            buildNumeroPalma(),
            buildOrientacion(),
          ],
        ));
  }

  Widget buildLineaPalma() {
    return Container(
        margin: const EdgeInsets.all(5.0),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: _buildCantidad('Linea de palma')),
            ],
          )
        ]));
  }

  Widget buildNumeroPalma() {
    return Container(
        margin: const EdgeInsets.all(5.0),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: _buildCantidad('Numero de palma')),
            ],
          )
        ]));
  }

  Widget _buildCantidad(String campo) {
    return TextFormField(
      style: const TextStyle(fontSize: 20),
      textAlign: TextAlign.start,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: campo,
        labelStyle: const TextStyle(fontSize: 18),
        // hintText: campo,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      validator: (value) {
        if (utils.isNumeric(value!)) {
          return null;
        } else {
          return 'Este campo es necesario';
        }
      },
      onChanged: (String value) {
        if (campo == 'Linea de palma') {
          lineapalma = int.parse(value);
        } else {
          numeropalma = int.parse(value);
        }
      },
    );
  }

  Widget buildOrientacion() {
    List<DropdownMenuItem<String>> getOpcionesDropdown() {
      List<DropdownMenuItem<String>> lista = [];
      for (var ece in orientaciones) {
        lista.add(DropdownMenuItem(
          value: ece,
          child: Text(ece),
        ));
      }
      return lista;
    }

    return Container(
        margin: const EdgeInsets.all(5.0),
        child: Row(children: <Widget>[
          // Icon(Icons.select_all),
          Expanded(
              child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            elevation: 5,
            isExpanded: true,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            value: orientacion,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                orientacion = opt;
              });
            },
            validator: (value) =>
                value == null ? 'Este campo es requerido' : null,
          ))
        ]));
  }

  Widget buildContinuar(BuildContext context) {
    return ElevatedButton(
      child: const Text(
        'continuar',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      // color: Colors.blue,
      // shape: StadiumBorder(),
      onPressed: () {
        _submit(context);
      },
    );
  }

  void _submit(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EnfermedadForm(
                  palgaArgumentos: PalmaArguments(
                      widget.nombreLote, lineapalma!, numeropalma!))));
    }
  }
}

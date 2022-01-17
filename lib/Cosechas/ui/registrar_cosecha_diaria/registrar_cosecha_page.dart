import 'package:apppalma/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/components/main_button.dart';
import 'package:apppalma/components/widgets/fecha.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:apppalma/utils/utils.dart' as utils;

class CosechaDiariaPage extends StatefulWidget {
  final Cosecha cosecha;
  const CosechaDiariaPage({Key? key, required this.cosecha}) : super(key: key);

  @override
  _CosechaDiariaPageState createState() => _CosechaDiariaPageState();
}

class _CosechaDiariaPageState extends State<CosechaDiariaPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final racimoscontroller = TextEditingController();
  final kiloscontroller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    racimoscontroller.dispose();
    kiloscontroller.dispose();
    super.dispose();
  }

  late Cosecha cosecha;
  late String nombrelote;
  DateTime fecha =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  var width;
  var height;
  var altoCard;
  var anchoCard;
  var margin;
  @override
  void initState() {
    cosecha = widget.cosecha;
    nombrelote = cosecha.nombreLote;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.3; //150,
    anchoCard = width;
    margin = anchoCard * 0.04;

    return Scaffold(
      body: Column(
        children: [
          const HeaderApp(),
          SingleChildScrollView(
            child: Column(children: <Widget>[
              buildDatosViaje(context),
              // card(),
              SizedBox(height: altoCard * 0.1),
              _buildRegistrarCosecha(context),
            ]),
          ),
        ],
      ),
    );
  }

  Widget buildDatosViaje(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(margin),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: anchoCard,
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 0, 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Expanded(
                          child: Text('Registrar cosecha diaria',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18, /*fontWeight: FontWeight.bold*/
                              )),
                        ),
                      ]),
                ),
                SizedBox(height: altoCard * 0.03),
                buildFecha(),
                SizedBox(height: altoCard * 0.1),
                buildCamposCosecha(),
                // buildRacimos(),
                // buildPeso(),
              ],
            )));
  }

  Widget buildFecha() {
    callback(DateTime f) {
      setState(() {
        fecha = f;
      });
    }

    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: FechaWidget(fecha: fecha, callback: callback)),
        ],
      )
    ]);
  }

  Widget buildCamposCosecha() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Container(
        //   width: width,
        //   // padding: EdgeInsets.fromLTRB(15.0, 10.0, 0, 10.0),
        //   child: Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         // Expanded(
        //         //   // child:Text('Ingrese los siguientes datos del viaje',textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 18, /*fontWeight: FontWeight.bold*/)),
        //         // ),
        //       ]),
        // ),
        SizedBox(height: height * 0.0009),
        Row(
          children: <Widget>[
            Expanded(child: _buildCantidad('cantidad racimos')),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(child: _buildCantidad('kilos')),
          ],
        ),
      ],
    );
  }

  Widget _buildCantidad(String campo) {
    return TextFormField(
      controller: campo == 'kilos' ? kiloscontroller : racimoscontroller,
      style: const TextStyle(fontSize: 25),
      textAlign: TextAlign.start,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: campo,
        labelStyle: const TextStyle(fontSize: 18),
        // hintText: campo,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      validator: (String? value) =>
          value != '' ? null : 'Debe ingresar un valor',
    );
  }

  Widget _buildRegistrarCosecha(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: MainButton(
          bold: true,
          text: 'Registrar cosecha',
          press: () {
            _submit(context);
          }),
    );
  }

  void _submit(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    if (formKey.currentState!.validate()) {
      try {
        final racimos = int.parse(racimoscontroller.text);
        final kilos = int.parse(kiloscontroller.text);
        formKey.currentState!.save();
        BlocProvider.of<CosechaCubit>(context)
            .insertarCosechaDiaria(fecha, racimos, kilos, cosecha);
        Navigator.pop(context);
      } catch (e) {}
    }
  }
}

import 'package:apppalma/presentation/components/widgets/header_gradient.dart';
import 'package:apppalma/presentation/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/presentation/components/main_button.dart';
import 'package:apppalma/presentation/components/widgets/fecha.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CosechaDiariaPage extends StatefulWidget {
  final Cosecha cosecha;
  final String routeName;
  const CosechaDiariaPage(
      {Key? key,
      required this.cosecha,
      this.routeName = '/lote/cosechas/registrardiarias'})
      : super(key: key);
  @override
  State<CosechaDiariaPage> createState() => _CosechaDiariaPageState();
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
  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;
  DateTime fecha =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  TimeOfDay horaSalida = TimeOfDay.now();

  @override
  void initState() {
    fecha = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, horaSalida.hour, horaSalida.minute);
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
          // HeaderApp(
          //   ruta: widget.routeName,
          // ),
          HeaderGradient(
            title: "Registrar cosecha diaria",
            ruta: widget.routeName,
          ),
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
                  padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0, 10.0),
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
        SizedBox(height: height * 0.0009),
        Row(
          children: <Widget>[
            Expanded(child: _buildCantidad('cantidad racimos')),
          ],
        ),
        const SizedBox(height: 10),
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
        label: Text(
          campo,
          style: const TextStyle(fontSize: 15),
        ),
        contentPadding: const EdgeInsets.only(left: 10),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
        ),
      ),
      // decoration: InputDecoration(
      //   labelText: campo,
      //   labelStyle: const TextStyle(fontSize: 18),
      //   // hintText: campo,
      //   border: const OutlineInputBorder(
      //       borderRadius: BorderRadius.all(Radius.circular(10))),
      // ),
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
      } catch (_) {}
    }
  }
}

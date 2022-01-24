import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/components/main_button.dart';
import 'package:apppalma/components/widgets/fecha.dart';
import 'package:apppalma/modules/Podas/cubit/podas_cubit.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PodaDiariaPage extends StatefulWidget {
  final Poda poda;
  final String routeName;
  const PodaDiariaPage(
      {Key? key,
      required this.poda,
      this.routeName = '/lote/podas/registrardiarios'})
      : super(key: key);
  @override
  _PodaDiariaPageState createState() => _PodaDiariaPageState();
}

class _PodaDiariaPageState extends State<PodaDiariaPage> {
  late Poda poda;
  DateTime fecha =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  TimeOfDay horaSalida = TimeOfDay.now();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _cantidadController = TextEditingController();
  int? cantidad;
  String? tipo;
  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;

  @override
  void initState() {
    fecha = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, horaSalida.hour, horaSalida.minute);
    poda = widget.poda;
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _cantidadController.dispose();
    super.dispose();
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
        HeaderApp(
          ruta: widget.routeName,
        ),
        SingleChildScrollView(
          child: Column(children: <Widget>[
            buildDatospoda(context),
            SizedBox(height: altoCard * 0.1),
            _buildRegistrarpoda(context),
          ]),
        ),
      ],
    ));
  }

  Widget buildDatospoda(BuildContext context) {
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
                          child: Text('Detalles de poda',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18, /*fontWeight: FontWeight.bold*/
                              )),
                        ),
                      ]),
                ),
                const SizedBox(height: 10),
                buildFecha(),
                const SizedBox(height: 10),
                buildPodas(),
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

  Widget buildPodas() {
    return TextFormField(
      controller: _cantidadController,
      style: const TextStyle(fontSize: 25),
      textAlign: TextAlign.start,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Palmas podadas',
        labelStyle: TextStyle(fontSize: 18),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      validator: (String? value) =>
          value != '' ? null : 'Debe ingresar un valor',
    );
  }

  Widget _buildRegistrarpoda(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: MainButton(
          bold: true,
          text: 'Registrar poda',
          press: () {
            _submit(context);
          }),
    );
  }

  void _submit(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    if (formKey.currentState!.validate()) {
      // formKey.currentState.save();
      // cantidad += poda.cantidadPlateada;
      final cantidad = int.parse(_cantidadController.text);
      BlocProvider.of<PodasCubit>(context)
          .insertarPodaDiaria(fecha, cantidad, poda);
      // podaBloc.insertarpodaDiario(fecha, cantidad, tipo, poda.id);
      // podaBloc.actualizarpodaLote(poda, cantidad);
      Navigator.pop(context);
    }
  }
}

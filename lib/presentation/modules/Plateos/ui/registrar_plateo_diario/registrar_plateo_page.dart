import 'package:apppalma/presentation/components/main_button.dart';
import 'package:apppalma/presentation/components/widgets/fecha.dart';
import 'package:apppalma/presentation/components/widgets/header_gradient.dart';
import 'package:apppalma/presentation/modules/Plateos/cubit/plateos_cubit.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlateoDiarioPage extends StatefulWidget {
  final Plateo plateo;
  final String routeName;
  const PlateoDiarioPage(
      {Key? key,
      required this.plateo,
      this.routeName = '/lote/plateos/registrardiarios'})
      : super(key: key);
  @override
  State<PlateoDiarioPage> createState() => _PlateoDiarioPageState();
}

class _PlateoDiarioPageState extends State<PlateoDiarioPage> {
  late Plateo plateo;
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
    plateo = widget.plateo;
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
        body: SingleChildScrollView(
      child: Column(
        children: [
          HeaderGradient(
            title: "Registrar plateo diario",
            ruta: widget.routeName,
          ),
          SingleChildScrollView(
            child: Column(children: <Widget>[
              buildDatosPlateo(context),
              SizedBox(height: altoCard * 0.1),
              _buildRegistrarPlateo(context),
            ]),
          ),
        ],
      ),
    ));
  }

  Widget buildDatosPlateo(BuildContext context) {
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
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text('Detalles de plateo',
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
                buildPlateos(),
                buildTipo()
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

  Widget buildPlateos() {
    return TextFormField(
      controller: _cantidadController,
      style: const TextStyle(fontSize: 25),
      textAlign: TextAlign.start,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        label: Text(
          'Palmas plateadas',
          style: TextStyle(fontSize: 15),
        ),
        contentPadding: EdgeInsets.only(left: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
        ),
      ),
      validator: (String? value) =>
          value != '' ? null : 'Debe ingresar un valor',
    );
  }

  Widget buildTipo() {
    return Container(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
        margin: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            const Row(
              children: [
                Expanded(
                  child: Text('Tipo de plateo',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ],
            ),
            _buildTipoPlateo(),
          ],
        ));
  }

  Widget _buildTipoPlateo() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio<String>(
              value: 'mecanico',
              groupValue: tipo,
              onChanged: (valor) {
                setState(() {
                  tipo = valor.toString();
                });
              },
            ),
            const Text('Mecanico'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio<String>(
              value: 'quimico',
              groupValue: tipo,
              onChanged: (valor) {
                setState(() {
                  tipo = valor;
                });
              },
            ),
            const Text('Quimico'),
          ],
        ),
      ],
    );
  }

  Widget _buildRegistrarPlateo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: MainButton(
          bold: true,
          text: 'Registrar plateo',
          press: () {
            _submit(context);
          }),
    );
  }

  void _submit(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    if (formKey.currentState!.validate()) {
      // formKey.currentState.save();
      // cantidad += plateo.cantidadPlateada;
      final cantidad = int.parse(_cantidadController.text);
      BlocProvider.of<PlateosCubit>(context)
          .insertarPlateoDiario(fecha, cantidad, tipo!, plateo);
      // plateoBloc.insertarPlateoDiario(fecha, cantidad, tipo, plateo.id);
      // plateoBloc.actualizarPlateoLote(plateo, cantidad);
      Navigator.pop(context);
    }
  }
}

import 'package:apppalma/presentation/components/main_button.dart';
import 'package:apppalma/presentation/components/widgets/fecha.dart';
import 'package:apppalma/presentation/components/widgets/header_gradient.dart';
import 'package:apppalma/presentation/modules/Podas/cubit/podas_cubit.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../components/widgets/orientacion_dropdown.dart';

class PodaDiariaPage extends StatefulWidget {
  final Poda poda;
  final String routeName;
  const PodaDiariaPage(
      {Key? key,
      required this.poda,
      this.routeName = '/lote/podas/registrardiarios'})
      : super(key: key);
  @override
  State<PodaDiariaPage> createState() => _PodaDiariaPageState();
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

  PodaDiariaData? ultimaPodaDiaria;
  int? lineaInicio;
  int? numeroPalmaInicio;
  String? orientacionInicio;
  int? lineaFin;
  int? numeroPalmaFin;
  String? orientacionFin;
  @override
  void initState() {
    super.initState();
    fecha = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, horaSalida.hour, horaSalida.minute);
    poda = widget.poda;
    if (BlocProvider.of<PodasCubit>(context).state.podasDiarias != null &&
        BlocProvider.of<PodasCubit>(context).state.podasDiarias!.isNotEmpty) {
      ultimaPodaDiaria =
          BlocProvider.of<PodasCubit>(context).state.podasDiarias!.last;
      if (ultimaPodaDiaria != null) {
        lineaInicio = int.tryParse(ultimaPodaDiaria!.lineaFin);
        numeroPalmaInicio = int.tryParse(ultimaPodaDiaria!.numeroFin);
        orientacionInicio = ultimaPodaDiaria!.orientacionFin;
      }
    }
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
          title: "Registrar poda diaria",
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
    )));
  }

  Widget buildDatospoda(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(margin),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: anchoCard,
                  padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0, 10.0),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
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
                const SizedBox(height: 20),
                const Text('Donde comenzó',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18, /*fontWeight: FontWeight.bold*/
                    )),
                _ubicacionDelFoco(),
                const SizedBox(height: 10),
                const Text('Donde termino',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18, /*fontWeight: FontWeight.bold*/
                    )),
                _ubicacionDelFocoFin()
              ],
            )));
  }

  Widget _ubicacionDelFoco() {
    return Column(
      children: [
        const SizedBox(height: 15),
        FormBuilderTextField(
          initialValue: lineaInicio?.toString(),
          onChanged: (value) => lineaInicio = int.tryParse(value ?? ''),
          name: 'linea',
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 18),
          decoration: const InputDecoration(
            label: Text(
              "Linea",
              style: TextStyle(fontSize: 18),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            ),
          ),
          validator: (value) =>
              value == null || value == '' ? 'Este campo es requerido' : null,
        ),
        const SizedBox(height: 15),
        FormBuilderTextField(
          onChanged: (value) {
            if (value != null && value != '') {
              numeroPalmaInicio = int.tryParse(value)!;
            }
          },
          name: 'numero',
          initialValue: numeroPalmaInicio?.toString(),
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 18),
          decoration: const InputDecoration(
            label: Text(
              "Número",
              style: TextStyle(fontSize: 18),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            ),
          ),
          validator: (value) =>
              value == null || value == '' ? 'Este campo es requerido' : null,
        ),
        const SizedBox(height: 15),
        OrientacionPalmaDropwdown(
          setState: () {
            setState(() {});
          },
          blocCall: (String value) {
            orientacionInicio = value;
          },
          initialValue: orientacionInicio,
        ),
      ],
    );
  }

  Widget _ubicacionDelFocoFin() {
    return Column(
      children: [
        const SizedBox(height: 15),
        FormBuilderTextField(
          onChanged: (value) => lineaFin = int.tryParse(value ?? ''),
          name: 'linea',
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 18),
          decoration: const InputDecoration(
            label: Text(
              "Linea",
              style: TextStyle(fontSize: 18),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            ),
          ),
          validator: (value) =>
              value == null || value == '' ? 'Este campo es requerido' : null,
        ),
        const SizedBox(height: 15),
        FormBuilderTextField(
          onChanged: (value) {
            if (value != null && value != '') {
              numeroPalmaFin = int.tryParse(value)!;
            }
          },
          name: 'numero',
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 18),
          decoration: const InputDecoration(
            label: Text(
              "Número",
              style: TextStyle(fontSize: 18),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            ),
          ),
          validator: (value) =>
              value == null || value == '' ? 'Este campo es requerido' : null,
        ),
        const SizedBox(height: 15),
        OrientacionPalmaDropwdown(setState: () {
          setState(() {});
        }, blocCall: (String value) {
          orientacionFin = value;
        }),
      ],
    );
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
        label: Text(
          'Palmas podadas',
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
      BlocProvider.of<PodasCubit>(context).insertarPodaDiaria(
          fecha,
          cantidad,
          poda,
          lineaInicio!.toString(),
          numeroPalmaInicio!.toString(),
          orientacionInicio!,
          lineaFin!.toString(),
          numeroPalmaFin!.toString(),
          orientacionFin!);
      // podaBloc.insertarpodaDiario(fecha, cantidad, tipo, poda.id);
      // podaBloc.actualizarpodaLote(poda, cantidad);
      Navigator.pop(context);
    }
  }
}

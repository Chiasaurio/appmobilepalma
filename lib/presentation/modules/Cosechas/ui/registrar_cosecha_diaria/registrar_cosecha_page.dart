import 'package:apppalma/presentation/components/widgets/header_gradient.dart';
import 'package:apppalma/presentation/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/presentation/components/main_button.dart';
import 'package:apppalma/presentation/components/widgets/fecha.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../components/widgets/orientacion_dropdown.dart';
import '../../../../constants.dart';

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

  CosechaDiariaData? ultimaCosechaDiaria;
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
    cosecha = widget.cosecha;
    nombrelote = cosecha.nombreLote;
    if (BlocProvider.of<CosechaCubit>(context).state.cosechasDiarias != null &&
        BlocProvider.of<CosechaCubit>(context)
            .state
            .cosechasDiarias!
            .isNotEmpty) {
      ultimaCosechaDiaria =
          BlocProvider.of<CosechaCubit>(context).state.cosechasDiarias!.last;
      if (ultimaCosechaDiaria != null) {
        lineaInicio = int.tryParse(ultimaCosechaDiaria!.lineaFin);
        numeroPalmaInicio = int.tryParse(ultimaCosechaDiaria!.numeroFin);
        orientacionInicio = ultimaCosechaDiaria!.orientacionFin;
      }
    }
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
            title: "Cosecha diaria",
            ruta: widget.routeName,
          ),
          Column(children: <Widget>[
            buildDatosViaje(context),
            // card(),
            SizedBox(height: altoCard * 0.1),
            _buildRegistrarCosecha(context),
          ]),
        ],
      ),
    ));
  }

  Widget buildDatosViaje(BuildContext context) {
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
        BlocProvider.of<CosechaCubit>(context).insertarCosechaDiaria(
            fecha,
            racimos,
            kilos,
            cosecha,
            lineaInicio!.toString(),
            numeroPalmaInicio!.toString(),
            orientacionInicio!,
            lineaFin!.toString(),
            numeroPalmaFin!.toString(),
            orientacionFin!);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: kSuccessColor,
              content: Text('Se registró la cosecha correctamente'),
            ),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: kRedColor,
              content: Text('Error registrando la cosecha.'),
            ),
          );
          Navigator.pop(context);
        }
      }
    }
  }
}

import 'package:apppalma/presentation/components/main_button.dart';
import 'package:apppalma/presentation/components/widgets/fecha.dart';
import 'package:apppalma/presentation/components/widgets/header_gradient.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/presentation/modules/Fertilizaciones/cubit/fertilizaciones_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:apppalma/utils/utils.dart' as utils;

import '../widgets/lista_fertilizante.dart';

class FertilizacionDiariaPage extends StatefulWidget {
  final Fertilizacione fertilizacion;
  final String routeName;
  const FertilizacionDiariaPage(
      {Key? key,
      required this.fertilizacion,
      this.routeName = '/lote/fertilizacion/registrardiarias'})
      : super(key: key);
  @override
  State<FertilizacionDiariaPage> createState() =>
      _FertilizacionDiariaPageState();
}

class _FertilizacionDiariaPageState extends State<FertilizacionDiariaPage> {
  late Fertilizacione fertilizacion;
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
  String? unidades;
  double? dosis;
  late List<FertilizanteData> fertilizantes;
  FertilizanteData? fertilizante;
  @override
  void initState() {
    fecha = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, horaSalida.hour, horaSalida.minute);
    fertilizacion = widget.fertilizacion;
    BlocProvider.of<FertilizacionCubit>(context).cargarFertilizantes();
    super.initState();
  }

  @override
  void dispose() {
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
            title: "Registrar fertilización diaria",
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
                          child: Text('Detalles de fertilización',
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
                buildFertilizadas(),
                const SizedBox(height: 10),
                buildProducto(),
                const SizedBox(height: 10),
                buildDosis(),
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

  Widget buildFertilizadas() {
    return TextFormField(
      controller: _cantidadController,
      style: const TextStyle(fontSize: 25),
      textAlign: TextAlign.start,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        label: Text(
          'Palmas fertilizadas',
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

  Widget buildProducto() {
    callbackfertilizante(FertilizanteData f) {
      setState(() {
        fertilizante = f;
      });
    }

    return BlocBuilder<FertilizacionCubit, FertilizacionStateLoaded>(
      builder: (context, state) {
        if (state.fertilizantes != null) {
          if (state.fertilizantes!.isNotEmpty) {
            return ListaFertilizantes(
              callbackfertilizante: callbackfertilizante,
              fertilizantes: state.fertilizantes!,
            );
          } else {
            return const Text('No hay fertilizantes registrados');
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget buildDosis() {
    return Column(
      children: [
        _buildDosis(),
        FormBuilderChoiceChip<String>(
          validator: (value) {
            return value != null ? null : "El campo es necesario.";
          },
          selectedColor: kblueColor,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
              labelText: 'Por favor seleccione las unidades:'),
          name: 'languages_choice',
          initialValue: null,
          options: const [
            FormBuilderChipOption(
              value: 'cm3',
            ),
            FormBuilderChipOption(
              value: 'gr',
            ),
            FormBuilderChipOption(
              value: 'ml',
            ),
          ],
          onChanged: (v) {
            unidades = v;
          },
        ),
      ],
    );
  }

  Widget _buildDosis() {
    return TextFormField(
        textAlign: TextAlign.start,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          label: Text(
            "Dosis",
            style: TextStyle(fontSize: 15),
          ),
          contentPadding: EdgeInsets.only(left: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
          ),
        ),
        onChanged: (String value) {
          dosis = double.parse(value);
        },
        validator: (value) {
          if (utils.isNumeric(value!)) {
            return null;
          } else {
            return 'Este campo es necesario';
          }
        });
  }

  Widget _buildRegistrarPlateo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: MainButton(
          bold: true,
          text: 'Registrar fertilización',
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
      BlocProvider.of<FertilizacionCubit>(context).insertarFertilizacionDiaria(
          fecha,
          cantidad,
          fertilizante!.nombreFertilizante,
          dosis!,
          unidades!,
          fertilizacion);

      // plateoBloc.insertarPlateoDiario(fecha, cantidad, tipo, plateo.id);
      // plateoBloc.actualizarPlateoLote(plateo, cantidad);
      Navigator.pop(context);
    }
  }
}

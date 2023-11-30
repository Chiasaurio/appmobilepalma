import 'package:apppalma/presentation/components/secondary_button.dart';
import 'package:apppalma/presentation/components/toasts/toasts.dart';
import 'package:apppalma/presentation/components/widgets/fecha.dart';
import 'package:apppalma/presentation/modules/Censo/cubit/censos_cubit.dart';
import 'package:apppalma/presentation/modules/Fumigaciones/cubit/fumigacion_cubit.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:apppalma/utils/utils.dart' as utils;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:intl/intl.dart';

import '../../../../constants.dart';
// import 'package:sqflite/sqflite.dart';

class FumigacionForm extends StatefulWidget {
  final CensoData censo;
  final List<ProductoAgroquimicoData> productos;
  const FumigacionForm({
    Key? key,
    required this.censo,
    required this.productos,
  }) : super(key: key);
  @override
  State<FumigacionForm> createState() => _FumigacionFormState();
}

class _FumigacionFormState extends State<FumigacionForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProductoAgroquimicoData? producto;
  late List<ProductoAgroquimicoData> productos;
  DateTime fechaaplicacion =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  late DateTime fechareingreso;
  final dosiscontroller = TextEditingController();

  bool triplelavado1 = false;
  bool triplelavado2 = false;
  bool triplelavado3 = false;
  bool advertencialavado = false;

  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;
  late CensoData censo;
  String? nombrelote;
  double? dosis;
  String? unidades;

  int? area;
  int? periodocarencia;
  bool advertenciaproducto = false;

  @override
  void initState() {
    // fechareingreso = fechaaplicacion
    //     .add(Duration(days: producto!.periodoCarenciaProductoAgroquimico));
    censo = widget.censo;
    productos = widget.productos;
    super.initState();
  }

  @override
  void dispose() {
    dosiscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // productoBloc.addProducto();
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.4; //150,
    anchoCard = width;
    margin = anchoCard * 0.02;

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        buildFumigacionForm(),
        // card(),
        SizedBox(height: altoCard * 0.1),
        Padding(
          padding: const EdgeInsets.only(bottom: 100.0, left: 20, right: 20),
          child: _buildRegistrarFumigacion(context),
        ),
      ]),
    );
  }

  Widget buildFumigacionForm() {
    return Container(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
        margin: const EdgeInsets.all(10),
        child: Form(
            key: formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  buildProducto(),
                  advertenciaproducto
                      ? const Text('Debe seleccionar el producto',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.red))
                      : const SizedBox(),
                  SizedBox(height: altoCard * 0.05),
                  buildDosis(),
                  SizedBox(height: altoCard * 0.05),
                  buildArea(),
                  SizedBox(height: altoCard * 0.05),
                  buildTripeLavado(),
                  advertencialavado
                      ? const Text('Debe confirmar el triple lavado',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.red))
                      : const SizedBox(),
                ])));
  }

  Widget buildFecha() {
    callback(DateTime f) {
      setState(() {
        fechaaplicacion = f;
      });
    }

    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
              child: FechaWidget(fecha: fechaaplicacion, callback: callback)),
        ],
      )
    ]);
  }

  Widget buildProducto() {
    List<DropdownMenuItem<ProductoAgroquimicoData>> getOpcionesDropdown() {
      List<DropdownMenuItem<ProductoAgroquimicoData>> lista = [];
      for (var producto in productos) {
        lista.add(DropdownMenuItem(
          value: producto,
          child: Text(producto.nombreProductoAgroquimico),
        ));
      }
      return lista;
    }

    return Row(children: <Widget>[
      // Icon(Icons.select_all),
      Expanded(
        child: DropdownButtonFormField<ProductoAgroquimicoData>(
          decoration: const InputDecoration(
            label: Text(
              "Productos",
              style: TextStyle(fontSize: 15),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            ),
          ),
          elevation: 5,
          isExpanded: true,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          value: producto,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
              producto = opt!;
              advertenciaproducto = false;
            });
            fechareingreso = fechaaplicacion.add(
                Duration(days: producto!.periodoCarenciaProductoAgroquimico));
          },
          validator: (value) =>
              value == null ? 'Este campo es requerido' : null,
        ),
      )
    ]);
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
          dosis = double.tryParse(value);
        },
        validator: (value) {
          if (utils.isNumeric(value!)) {
            return null;
          } else {
            return 'Este campo es necesario';
          }
        });
  }

  Widget buildArea() {
    return TextFormField(
        textAlign: TextAlign.start,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          label: Text(
            'Area (hectareas)',
            style: TextStyle(fontSize: 15),
          ),
          contentPadding: EdgeInsets.only(left: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
          ),
        ),
        onChanged: (String value) {
          if (value != "") {
            area = int.parse(value);
          }
        },
        validator: (value) {
          if (utils.isNumeric(value!)) {
            return null;
          } else {
            return 'Este campo es necesario';
          }
        });
  }

  Widget buildPeriodoCarencia() {
    return Row(
      children: <Widget>[
        Expanded(
          child: _buildPeriodoCarencia(),
        ),
      ],
    );
  }

  Widget _buildPeriodoCarencia() {
    return TextFormField(
        textAlign: TextAlign.start,
        style: const TextStyle(fontSize: 20),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Periodo de carencia (dias)',
          labelStyle: TextStyle(fontSize: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        onChanged: (String value) {
          periodocarencia = int.parse(value);
        },
        validator: (value) {
          if (utils.isNumeric(value!)) {
            return null;
          } else {
            return 'Este campo es necesario';
          }
        });
  }

  Widget fechaReingreso() {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: const Text('Ingrese la fecha de reingreso',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey)),
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: buildFechaReingreso(),
          ),
        ],
      )
    ]);
  }

  Widget buildFechaReingreso() {
    callbackreingreso(DateTime f) {
      setState(() {
        fechareingreso = f;
      });
    }

    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
              child: FechaWidget(
                  fecha: fechareingreso, callback: callbackreingreso)),
        ],
      )
    ]);
  }

  Widget buildTripeLavado() {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: const Text('Chequeo de triple lavado:',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey)),
            ),
          ),
        ],
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Checkbox(
                  value: triplelavado1,
                  onChanged: (value) {
                    setState(() {
                      triplelavado1 = value!;
                    });
                  },
                ),
                const Text('Lavado del envase',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Checkbox(
                  value: triplelavado2,
                  onChanged: (value) {
                    setState(() {
                      triplelavado2 = value!;
                    });
                  },
                ),
                const Text('Lavado del equipo',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Checkbox(
                  value: triplelavado3,
                  onChanged: (value) {
                    setState(() {
                      triplelavado3 = value!;
                    });
                  },
                ),
                const Text('Lavado del lugar',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ],
            ),
          ],
        ),
      )
    ]);
  }

  Widget _buildRegistrarFumigacion(BuildContext context) {
    return ButtonTheme(
        height: 50,
        minWidth: 200,
        child: SecondaryButton(
          text: 'Continuar',
          press: () {
            _submitFumigacion(context);
            // Navigator.pushNamed( context , 'lote/palmas/estadopalma/registrospalma', arguments: palmaseleccionada);
          },
        ));
  }

  void _submitFumigacion(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      if (triplelavado1 && triplelavado2 && triplelavado3) {
        setState(() {
          advertencialavado = true;
        });
      } else {
        setState(() {
          advertencialavado = true;
        });
      }
    }
    if (formKey.currentState!.validate()) {
      if (triplelavado1 && triplelavado2 && triplelavado3) {
        setState(() {
          advertencialavado = false;
        });
        _confirmacionAlerta(context);
      } else {
        setState(() {
          advertencialavado = true;
        });
      }
    }
  }

  void _confirmacionAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
              content:
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Expanded(child: Text('fecha registro: ')),
                    Expanded(
                      child: Text(
                        DateFormat('yyyy-MM-dd').format(fechaaplicacion),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Expanded(child: Text('foco: ')),
                    Expanded(
                      child: Text(
                        'Numero de linea ${censo.numerolinea.toString()}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Expanded(child: Text('Producto: ')),
                    Expanded(
                      child: Text(
                        producto!.nombreProductoAgroquimico,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(height: margin),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Expanded(child: Text('Dosis: ')),
                    Expanded(
                      child: Text(
                        dosis.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(height: margin),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Expanded(child: Text('fecha reingreso: ')),
                    Expanded(
                      child: Text(
                        DateFormat('yyyy-MM-dd').format(fechareingreso),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ]),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    registrarAplicacion(context);
                    // Navigator.popUntil(context, ModalRoute.withName('lote/cosechas'));
                  },
                )
              ]);
        });
  }

  void registrarAplicacion(BuildContext context) async {
    try {
      await BlocProvider.of<FumigacionCubit>(context).registrarAplicacion(
          fechaaplicacion,
          fechareingreso,
          dosis!,
          unidades!,
          censo,
          producto!.idProductoAgroquimico,
          area!);
      if (!mounted) return;
      BlocProvider.of<CensosCubit>(context)
          .obtenerCensosPendientes(widget.censo.nombreLote);
      Navigator.of(context).pop();
    } catch (e) {
      registroFallidoToast('$e');
      Navigator.of(context).pop();
    }
  }
}

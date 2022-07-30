import 'package:apppalma/components/secondary_button.dart';
import 'package:apppalma/components/toasts/toasts.dart';
import 'package:apppalma/components/widgets/fecha.dart';
import 'package:apppalma/modules/Fumigaciones/cubit/fumigacion_cubit.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:apppalma/utils/utils.dart' as utils;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
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
  _FumigacionFormState createState() => _FumigacionFormState();
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
        _buildRegistrarFumigacion(context),
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
                  SizedBox(height: altoCard * 0.05),
                  buildFecha(),
                  SizedBox(height: altoCard * 0.05),
                  buildProducto(),
                  advertenciaproducto
                      ? const Text('Debe seleccionar el producto',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.red))
                      : const SizedBox(),
                  SizedBox(height: altoCard * 0.05),
                  buildDosis(),
                  SizedBox(height: altoCard * 0.05),
                  // buildPeriodoCarencia(),
                  // SizedBox(height: altoCard * 0.05),
                  // fechaReingreso(),
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
    return Column(children: <Widget>[
      Row(
        children: const <Widget>[
          Expanded(
            child: Text('Seleccione el producto:',
                style: TextStyle(fontSize: 16.0, color: Colors.grey)),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: _buildProducto(),
          ),
        ],
      )
    ]);
  }

  Widget _buildProducto() {
    List<DropdownMenuItem<ProductoAgroquimicoData>> getOpcionesDropdown() {
      List<DropdownMenuItem<ProductoAgroquimicoData>> lista = [];
      for (var producto in productos) {
        lista.add(DropdownMenuItem(
          child: Text(producto.nombreProductoAgroquimico),
          value: producto,
        ));
      }
      return lista;
    }

    return Row(children: <Widget>[
      // Icon(Icons.select_all),
      Expanded(
        child: DropdownButtonFormField<ProductoAgroquimicoData>(
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
      children: <Widget>[
        _buildDosis(),
        _buildUnidades(),
      ],
    );
  }

  Widget _buildDosis() {
    return TextFormField(
        textAlign: TextAlign.start,
        style: const TextStyle(fontSize: 20),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Dosis',
          labelStyle: TextStyle(fontSize: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        onChanged: (String value) {
          if (value != "") {
            dosis = double.parse(value);
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

  Widget _buildUnidades() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          child: Container(
              margin: const EdgeInsets.all(1),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: unidades == 'cm3' ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 1, offset: Offset(0, 1))
                  ]),
              child: const Text('cm3',
                  style: TextStyle(fontSize: 15.0),
                  textAlign: TextAlign.center)),
          onTap: (() {
            setState(() {
              unidades = 'cm3';
            });
          }),
        ),
        GestureDetector(
          child: Container(
              margin: const EdgeInsets.all(1),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: unidades == 'gr' ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 1, offset: Offset(0, 1))
                  ]),
              child: const Text('gr',
                  style: TextStyle(fontSize: 15.0),
                  textAlign: TextAlign.center)),
          onTap: (() {
            setState(() {
              unidades = 'gr';
            });
          }),
        ),
        GestureDetector(
          child: Container(
              margin: const EdgeInsets.all(1),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: unidades == 'ml' ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 1, offset: Offset(0, 1))
                  ]),
              child: const Text('ml',
                  style: TextStyle(fontSize: 15.0),
                  textAlign: TextAlign.center)),
          onTap: (() {
            setState(() {
              unidades = 'ml';
            });
          }),
        ),
      ],
    );
  }

  Widget buildArea() {
    return Row(
      children: <Widget>[
        Expanded(
          child: _buildArea(),
        ),
      ],
    );
  }

  Widget _buildArea() {
    return TextFormField(
        textAlign: TextAlign.start,
        style: const TextStyle(fontSize: 20),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Area (hectareas)',
          labelStyle: TextStyle(fontSize: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
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
                const Text('triplelavado1',
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
                const Text('triplelavado2',
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
                const Text('triplelavado3',
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
                    const Expanded(child: Text('sector: ')),
                    Expanded(
                      child: Text(
                        '${censo.lineaLimite1.toString()} - ${censo.lineaLimite2.toString()}',
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
          censo,
          producto!.idProductoAgroquimico,
          area!);
      Navigator.of(context).pop();
    } catch (e) {
      registroFallidoToast('$e');
      Navigator.of(context).pop();
    }
  }
}

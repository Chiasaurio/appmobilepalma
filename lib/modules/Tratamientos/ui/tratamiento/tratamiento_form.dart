import 'package:apppalma/components/secondary_button.dart';
import 'package:apppalma/components/toasts/toasts.dart';
import 'package:apppalma/components/widgets/fecha.dart';
import 'package:apppalma/modules/Tratamientos/cubit/tratamiento_cubit.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/registroenfermedad_table.dart';
import 'package:flutter/material.dart';
import 'package:apppalma/utils/utils.dart' as utils;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'biologico_view.dart';
import 'quimico_view.dart';

class TratamientoForm extends StatefulWidget {
  final PalmaConEnfermedad palmaConEnfermedad;
  final String routeName;
  final List<ProductoAgroquimicoData> productos;
  const TratamientoForm(
      {Key? key,
      required this.palmaConEnfermedad,
      required this.productos,
      this.routeName = '/lote/aplicaciones/registrartratamiento'})
      : super(key: key);
  @override
  _TratamientoFormState createState() => _TratamientoFormState();
}

class _TratamientoFormState extends State<TratamientoForm> {
  late DateTime fecha;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;
  double? dosis;
  String? ruta;
  String? tipocontrol;
  ProductoAgroquimicoData? productobiologico;
  ProductoAgroquimicoData? productoquimico;
  late List<ProductoAgroquimicoData> productosChanged;
  String? unidades;
  late String descripcion;
  late PalmaConEnfermedad palmaconenfermedad;
  late RegistroEnfermedadData registroEnfermedad;
  late Palma palma;
  bool advertenciaproductoquimico = false;
  bool advertenciaproductobiologico = false;
  bool advertenciaunidades = false;
  bool advertenciadosis = false;
  TimeOfDay horaSalida = TimeOfDay.now();

  @override
  void initState() {
    fecha = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, horaSalida.hour, horaSalida.minute);
    productosChanged = widget.productos;
    registroEnfermedad = widget.palmaConEnfermedad.registroEnfermedad;
    palma = widget.palmaConEnfermedad.palma;
    descripcion = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    palmaconenfermedad = widget.palmaConEnfermedad;
    palma = palmaconenfermedad.palma;
    registroEnfermedad = palmaconenfermedad.registroEnfermedad;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.3; //150,
    anchoCard = width;
    margin = anchoCard * 0.04;
    // productoBloc.addProducto();

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        buildTratamientoForm(),
        // card(),
        SizedBox(height: altoCard * 0.1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: buildRegistrarTratamiento(context),
        ),
      ]),
    );
  }

  Widget buildTratamientoForm() {
    return Container(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
        margin: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: altoCard * 0.1),
              buildFecha(),
              SizedBox(height: altoCard * 0.1),
              buildTipo(),
              buildProducto(),
              advertenciaproductobiologico
                  ? const Text('Debe seleccionar el producto',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.red))
                  : const SizedBox(),
              advertenciaproductoquimico
                  ? const Text('Debe seleccionar el producto',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.red))
                  : const SizedBox(),
              SizedBox(height: altoCard * 0.1),
              buildDosis(),
              SizedBox(height: altoCard * 0.1),
              advertenciaunidades
                  ? const Text('Debe seleccionar las unidades',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.red))
                  : const SizedBox(),
            ],
          ),
        ));
  }

  Widget buildTipo() {
    return Container(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
        child: Column(
          children: <Widget>[
            Row(
              children: const <Widget>[
                Text('Tipo de control:',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey))
              ],
            ),
            Row(
              children: <Widget>[_buildTipo()],
            ),
          ],
        ));
  }

  Widget _buildTipo() {
    return Row(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio<String>(
              value: 'Biologico',
              groupValue: tipocontrol,
              onChanged: (valor) {
                setState(() {
                  productosChanged = widget.productos
                      .where((element) => element.claseProducto == valor!)
                      .toList();
                  tipocontrol = valor;
                });
              },
            ),
            const Text('Biologico',
                style: TextStyle(fontSize: 20.0, color: Colors.black)),
          ],
        ),
        const SizedBox(width: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio<String>(
              value: 'Químico',
              groupValue: tipocontrol,
              onChanged: (valor) {
                setState(() {
                  productosChanged = widget.productos
                      .where((element) => element.claseProducto == valor!)
                      .toList();
                  tipocontrol = valor;
                });
              },
            ),
            const Text('Quimico',
                style: TextStyle(fontSize: 20.0, color: Colors.black)),
          ],
        ),
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

  Widget buildProducto() {
    callbackproductoquimico(ProductoAgroquimicoData p) {
      setState(() {
        productoquimico = p;
      });
    }

    callbackproductobiologico(ProductoAgroquimicoData p) {
      setState(() {
        productobiologico = p;
      });
    }

    if (tipocontrol != null) {
      if (tipocontrol == 'Químico') {
        return ProductoQuimico(
          callbackproducto: callbackproductoquimico,
          productos: productosChanged,
        );
      } else {
        return ControlBiologico(
          callbackproducto: callbackproductobiologico,
          productos: productosChanged,
        );
      }
    } else {
      return const Text('');
    }
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

  Widget buildRegistrarTratamiento(BuildContext context) {
    return ButtonTheme(
        height: 50,
        minWidth: 200,
        child: SecondaryButton(
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(30)
          // ),
          // child: const Text(
          text: 'Registrar tratamiento',
          //   style: TextStyle(color: Colors.black, fontSize: 16),
          // ),
          // color: Colors.blue[100],
          press: () {
            _submitTratamiento(context);
          },
        ));
  }

  void _submitTratamiento(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      if (unidades != null) {
        setState(() {
          advertenciaunidades = false;
        });
      } else {
        setState(() {
          advertenciaunidades = true;
        });
      }
      if (tipocontrol == 'quimico' && productoquimico == null) {
        setState(() {
          advertenciaproductoquimico = true;
        });
      } else {
        setState(() {
          advertenciaproductoquimico = false;
        });
      }
      if (tipocontrol == 'biologico' && productobiologico == null) {
        setState(() {
          advertenciaproductobiologico = true;
        });
      } else {
        setState(() {
          advertenciaproductobiologico = false;
        });
      }
      return;
    }
    if (formKey.currentState!.validate()) {
      if (unidades != null) {
        setState(() {
          advertenciaunidades = false;
        });
      } else {
        setState(() {
          advertenciaunidades = true;
        });
      }
      if (dosis != null) {
        setState(() {
          advertenciadosis = false;
        });
      } else {
        setState(() {
          advertenciadosis = true;
        });
      }
      if (tipocontrol == 'quimico' && productoquimico == null) {
        setState(() {
          advertenciaproductoquimico = true;
        });
      } else {
        setState(() {
          advertenciaproductoquimico = false;
        });
      }
      if (tipocontrol == 'biologico' && productobiologico == null) {
        setState(() {
          advertenciaproductobiologico = true;
        });
      } else {
        setState(() {
          advertenciaproductobiologico = false;
        });
      }
      if (!advertenciaunidades &&
          !advertenciadosis &&
          !advertenciaproductoquimico &&
          !advertenciaproductobiologico) {
        _confirmacionAlerta(context);
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
                    Expanded(child: Text('Producto: ')),
                    Expanded(
                      child: tipocontrol == 'quimico'
                          ? Text(
                              productoquimico!.nombreProductoAgroquimico,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              productobiologico!.nombreProductoAgroquimico,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                    )
                  ],
                ),
                SizedBox(height: margin),
                // tieneEtapas? Row(
                //   mainAxisSize: MainAxisSize.min,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: <Widget>[
                //     Expanded(child: Text('Etapa: ')),
                //     Expanded(
                //       // child: Text('$etapa', style: TextStyle( color: Colors.red),),
                //     )
                //   ],
                // ) : SizedBox(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Expanded(child: Text('Unidades: ')),
                    Expanded(
                      child: Text(
                        unidades!,
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
                    registrarTratamiento(context);
                    // Navigator.popUntil(context, ModalRoute.withName('lote/cosechas'));
                  },
                )
              ]);
        });
  }

  void registrarTratamiento(BuildContext context) async {
    try {
      bool resp = false;
      if (tipocontrol == 'Químico') {
        resp = await BlocProvider.of<TratamientoCubit>(context)
            .registrarTratamiento(
                registroEnfermedad.id,
                productoquimico!.idProductoAgroquimico,
                palma,
                tipocontrol!,
                dosis!,
                descripcion,
                fecha);
      } else {
        resp = await BlocProvider.of<TratamientoCubit>(context)
            .registrarTratamiento(
                registroEnfermedad.id,
                productobiologico!.idProductoAgroquimico,
                palma,
                tipocontrol!,
                dosis!,
                descripcion,
                fecha);
      }
      if (resp) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      } else {
        registroFallidoToast('Error registrando el tratamiento');
      }
    } catch (e) {
      print('error on method $e');
      registroFallidoToast(e.toString());
    }
  }
}

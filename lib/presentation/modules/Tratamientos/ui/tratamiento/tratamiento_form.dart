import 'package:apppalma/presentation/components/secondary_button.dart';
import 'package:apppalma/presentation/components/toasts/toasts.dart';
import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/data/moor/tables/registroenfermedad_table.dart';
import 'package:apppalma/presentation/modules/Tratamientos/cubit/tratamiento_cubit.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:apppalma/utils/utils.dart' as utils;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../LoteDetail/cubit/lote_detail_cubit.dart';
import '../../../LotesList/cubit/loteslist_cubit.dart';
import 'lista_productos.dart';

class TratamientoForm extends StatefulWidget {
  final PalmaConEnfermedad palmaConEnfermedad;
  final List<ProductoAgroquimicoData> productos;
  const TratamientoForm({
    Key? key,
    required this.palmaConEnfermedad,
    required this.productos,
  }) : super(key: key);
  @override
  State<TratamientoForm> createState() => _TratamientoFormState();
}

class _TratamientoFormState extends State<TratamientoForm> {
  late DateTime fecha;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double? dosis;
  String? tipocontrol;
  ProductoAgroquimicoData? productobiologico;
  ProductoAgroquimicoData? productoquimico;
  late List<ProductoAgroquimicoData> productosChanged;
  String? unidades;
  late String descripcion;
  late PalmaConEnfermedad palmaconenfermedad;
  late RegistroEnfermedadData registroEnfermedad;
  late Palma palma;
  TimeOfDay horaSalida = TimeOfDay.now();
  final _radiokey = GlobalKey<FormFieldState>();
  final _formKey = GlobalKey<FormBuilderState>();
  final _options = ["Biologico", "Químico"];
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

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: FormBuilder(
          key: _formKey,
          child: Column(children: <Widget>[
            _buildTipoControl(),
            const SizedBox(height: 10),
            if (tipocontrol != null) _buildProducto(),
            if (tipocontrol != null) buildDosis(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: buildRegistrarTratamiento(context),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildTipoControl() {
    return FormBuilderRadioGroup<String?>(
      key: _radiokey,
      name: "tipo",
      decoration: const InputDecoration(
          labelText: 'Tipo de control', labelStyle: TextStyle(fontSize: 16)),
      onChanged: (e) {
        setState(() {
          productosChanged = widget.productos
              .where((element) => element.claseProducto == e!)
              .toList();
          tipocontrol = e;
        });
      },
      initialValue: null,
      validator: FormBuilderValidators.required(),
      options: _options
          .map((lang) => FormBuilderFieldOption(
                value: lang,
                child: Text(lang),
              ))
          .toList(growable: false),
    );
  }

  Widget _buildProducto() {
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

    if (tipocontrol == 'Químico') {
      return ListaProductos(
        callbackproducto: callbackproductoquimico,
        productos: productosChanged,
      );
    } else {
      return ListaProductos(
        callbackproducto: callbackproductobiologico,
        productos: productosChanged,
      );
    }
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

  Widget buildRegistrarTratamiento(BuildContext context) {
    return ButtonTheme(
        height: 50,
        minWidth: 200,
        child: SecondaryButton(
          text: 'Registrar tratamiento',
          press: () {
            _submitTratamiento(context);
          },
        ));
  }

  void _submitTratamiento(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _confirmacionAlerta(context);
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
                    const Expanded(child: Text('Producto: ')),
                    Expanded(
                      child: tipocontrol == 'Químico'
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
                registroEnfermedad.idRegistroEnfermedad ??
                    registroEnfermedad.id,
                registroEnfermedad.idRegistroEnfermedad,
                productoquimico!.idProductoAgroquimico,
                palma,
                tipocontrol!,
                dosis!,
                unidades!,
                descripcion,
                fecha);
      } else {
        resp = await BlocProvider.of<TratamientoCubit>(context)
            .registrarTratamiento(
                registroEnfermedad.idRegistroEnfermedad ??
                    registroEnfermedad.id,
                registroEnfermedad.idRegistroEnfermedad,
                productobiologico!.idProductoAgroquimico,
                palma,
                tipocontrol!,
                dosis!,
                unidades!,
                descripcion,
                fecha);
      }
      if (resp) {
        if (!mounted) return;
        if (context.mounted) {
          BlocProvider.of<TratamientoCubit>(context)
              .obtenerPalmasEnfermas(palma.nombreLote);
          BlocProvider.of<LoteslistCubit>(context)
              .obtenerTodosLotesWithProcesos();
          final stateLote =
              BlocProvider.of<LoteDetailCubit>(context).state as LoteChoosed;
          BlocProvider.of<LoteDetailCubit>(context)
              .reloadLote(stateLote.lote.lote.id);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: kSuccessColor,
              content: Text('Se registró el tratamiento correctamente'),
            ),
          );
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }
      } else {
        registroFallidoToast('Error registrando el tratamiento');
      }
    } catch (e) {
      registroFallidoToast(e.toString());
    }
  }
}

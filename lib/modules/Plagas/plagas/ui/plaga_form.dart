import 'package:apppalma/components/toasts/toasts.dart';
import 'package:apppalma/data/moor/tables/plagas_table.dart';
import 'package:apppalma/modules/Plagas/cubit/plagas_cubit.dart';
import 'package:apppalma/modules/Plagas/plagas/ui/submit_plaga_button.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:apppalma/utils/utils.dart' as utils;

import '../../../../constants.dart';

class PlagaForm extends StatefulWidget {
  final List<PlagaConEtapas> plagas;
  final String nombreLote;
  const PlagaForm({
    Key? key,
    required this.nombreLote,
    required this.plagas,
  }) : super(key: key);
  @override
  State<PlagaForm> createState() => _PlagaFormState();
}

class _PlagaFormState extends State<PlagaForm> {
  PlagaConEtapas? plagaconetapas;
  EtapasPlagaData? etapa;
  List<EtapasPlagaData> etapasseleccionadas = [];
  bool advertenciaetapa = false;
  Palma? palma;
  DateTime fechacenso =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  String? ubicacionfoco;
  String observacion = '';

  bool? presencialote;
  bool? presenciasector;
  String? linealimite1;
  String? linealimite2;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormFieldState> _radiokey = GlobalKey<FormFieldState>();
  late PlagasCubit cubit;
  @override
  Widget build(BuildContext context) {
    cubit = context.read<PlagasCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: FormBuilder(
        key: _formKey,
        child: Column(children: <Widget>[
          buildPlaga(),
          const SizedBox(height: 15),
          if (plagaconetapas != null) buildEtapas(),
          const SizedBox(height: 15),
          buildUbicacionPlaga(),
          const SizedBox(height: 15),
          if (ubicacionfoco != null && ubicacionfoco == 'sector')
            buildCamposFoco(),
          const SizedBox(height: 15),
          SubmitPlagaButton(
            enabled: registrarPlagaEnabled,
          )
        ]),
      ),
    );
  }

  bool registrarPlagaEnabled() {
    if (_formKey.currentState!.validate()) {
      if (etapasseleccionadas.isEmpty) {
        advertenciaetapa = true;
        return false;
      }
      return true;
    }
    return false;
  }

  Widget buildPlaga() {
    List<DropdownMenuItem<PlagaConEtapas>> getOpcionesDropdown() {
      List<DropdownMenuItem<PlagaConEtapas>> lista = [];
      for (var plagaconetapas in widget.plagas) {
        lista.add(DropdownMenuItem(
          value: plagaconetapas,
          child: Text(plagaconetapas.plaga.nombreComunPlaga),
        ));
      }
      return lista;
    }

    return Row(children: <Widget>[
      Expanded(
        child: DropdownButtonFormField<PlagaConEtapas>(
          decoration: const InputDecoration(
            label: Text(
              "Plaga",
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
            fontSize: 15,
            color: Colors.black,
          ),
          value: plagaconetapas,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
              plagaconetapas = opt;
              cubit.changePlaga(plagaconetapas!);
            });
          },
          validator: (value) =>
              value == null ? 'Este campo es requerido' : null,
        ),
      )
    ]);
  }

  Widget buildEtapas() {
    return Column(
        children: plagaconetapas!.etapas.map((e) {
      return FormBuilderCheckbox(
          name: e.nombreEtapa,
          initialValue: false,
          checkColor: Colors.black,
          activeColor: kblueColor,
          onChanged: (value) {
            if (value!) {
              etapasseleccionadas.add(e);
            } else {
              etapasseleccionadas.removeWhere(
                (element) => element.idEtapasPlaga == e.idEtapasPlaga,
              );
            }
            cubit.changeEtapa(etapasseleccionadas);
          },
          validator: (value) {
            if (etapasseleccionadas.isEmpty) {
              return "Debe seleccionar una etapa por lo menos";
            }
            return null;
          },
          title: Text(
            e.nombreEtapa,
            style: const TextStyle(color: Colors.black),
          ));
    }).toList());
  }

  Widget buildUbicacionPlaga() {
    return FormBuilderRadioGroup<String?>(
      key: _radiokey,
      name: "tipo",
      decoration: const InputDecoration(
          labelText: 'Ubicación del foco:',
          labelStyle: TextStyle(fontSize: 16)),
      onChanged: (e) {
        if (e == "lote") {
          setState(() {
            presencialote = true;
            presenciasector = false;
            ubicacionfoco = e;
            linealimite1 = "0";
            linealimite2 = "0";
          });
        } else if (e == "sector") {
          setState(() {
            presencialote = false;
            presenciasector = true;
            ubicacionfoco = e;
          });
        }
        cubit.changePresencia(e!);
      },
      initialValue: null,
      validator: FormBuilderValidators.required(),
      options: ubicacionPlaga
          .map((lang) => FormBuilderFieldOption(
                value: lang,
                child: Text(lang),
              ))
          .toList(growable: false),
    );
  }

  Widget buildCamposFoco() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(child: _buildCantidad('Desde linea')),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(child: _buildCantidad('Hasta linea')),
          ],
        ),
      ],
    );
  }

  Widget _buildCantidad(String campo) {
    return TextFormField(
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
      validator: (value) {
        if (utils.isNumeric(value!)) {
          return null;
        } else {
          return 'Este campo es necesario';
        }
      },
      onChanged: (String value) {
        setState(() {
          if (campo == 'Desde linea') {
            linealimite1 = value;
            cubit.changeLimite1(int.parse(linealimite1!));
          } else {
            linealimite2 = value;
            cubit.changeLimite2(int.parse(linealimite2!));
          }
        });
      },
    );
  }

  // void _confirmacionAlerta(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       barrierDismissible: true,
  //       builder: (context) {
  //         return AlertDialog(
  //             content:
  //                 Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: <Widget>[
  //                   const Expanded(child: Text('Plaga: ')),
  //                   Expanded(
  //                     child: Text(
  //                       plagaconetapas!.plaga.nombreComunPlaga,
  //                       style: const TextStyle(
  //                           color: Colors.black,
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //               etapasseleccionadas.isNotEmpty
  //                   ? getEtapasSeleccionadas()
  //                   : const SizedBox(height: 20),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: <Widget>[
  //                   const Expanded(child: Text('Ubicacion: ')),
  //                   Expanded(
  //                     child: ubicacionfoco == 'sector'
  //                         ? Text(
  //                             '$linealimite1 - $linealimite2',
  //                             style: const TextStyle(
  //                                 color: Colors.black,
  //                                 fontSize: 16,
  //                                 fontWeight: FontWeight.bold),
  //                           )
  //                         : const Text(
  //                             'todo el lote',
  //                             style: TextStyle(
  //                                 color: Colors.black,
  //                                 fontSize: 16,
  //                                 fontWeight: FontWeight.bold),
  //                           ),
  //                   )
  //                 ],
  //               ),
  //               const SizedBox(height: 10),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: <Widget>[
  //                   const Expanded(child: Text('Fecha ')),
  //                   Expanded(
  //                     child: Text(
  //                       DateFormat('yMMMMEEEEd', 'es').format(fechacenso),
  //                       style: const TextStyle(
  //                           color: Colors.black,
  //                           fontSize: 16,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ]),
  //             actions: <Widget>[
  //               TextButton(
  //                 child: const Text('Cancelar'),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //               TextButton(
  //                 child: const Text('Ok'),
  //                 onPressed: () {
  //                   registrarPlaga(context);
  //                   // Navigator.popUntil(context, ModalRoute.withName('lote/cosechas'));
  //                 },
  //               )
  //             ]);
  //       });
  // }

  Widget getEtapasSeleccionadas() {
    return Column(
        children: etapasseleccionadas
            .map((e) => Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Expanded(child: Text('Etapa: ')),
                    Expanded(
                      child: Text(
                        e.nombreEtapa,
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ))
            .toList());
  }

  void registrarPlaga(BuildContext context) async {
    try {
      await BlocProvider.of<PlagasCubit>(context).insertarCenso(
        fechacenso,
        // presencialote!,
        // presenciasector!,
        // int.parse(linealimite1!),
        // int.parse(linealimite2!),
        // observacion,
        // plagaconetapas!.plaga.nombreComunPlaga,
        // widget.nombreLote,
        // etapasseleccionadas
      );
      if (!mounted) return;
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } catch (e) {
      registroFallidoToast('pailas');
    }
  }
}

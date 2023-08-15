import 'package:apppalma/data/moor/tables/plagas_table.dart';
import 'package:apppalma/presentation/components/widgets/orientacion_dropdown.dart';
import 'package:apppalma/presentation/modules/Camera/imagenes_registro_widget.dart';
import 'package:apppalma/presentation/modules/Plagas/cubit/plagas_cubit.dart';
import 'package:apppalma/presentation/modules/Plagas/models/etapa_individuo_model.dart';
import 'package:apppalma/presentation/modules/Plagas/plagas/ui/submit_plaga_button.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';

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
  List<EtapaIndividuosModel> etapasseleccionadas = [];
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
  late PlagasCubit cubit;

  List<XFile> imagenes = [];
  @override
  Widget build(BuildContext context) {
    cubit = context.read<PlagasCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: FormBuilder(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Ubicación del foco',
                style: TextStyle(fontSize: 18),
              ),
              _ubicacionDelFoco(),
              const SizedBox(height: 20),
              const Text(
                'Datos de la plaga',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 15),
              buildPlaga(),
              const SizedBox(height: 15),
              if (plagaconetapas != null) buildEtapas(),
              if (plagaconetapas != null && plagaconetapas!.etapas.isEmpty)
                _numeroIndividuos(),
              const SizedBox(height: 15),
              const Text(
                'Observaciones',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 15),
              _observaciones(),
              const SizedBox(height: 15),
              const Text(
                'Imagenes',
                style: TextStyle(fontSize: 18),
              ),
              ImagenesRegistro(
                  imagenes: imagenes,
                  setImages: (List<XFile> nuevasImagenes) {
                    imagenes = nuevasImagenes;
                    cubit.changeImagenes(imagenes);
                    setState(() {});
                  }),
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
      if (plagaconetapas!.etapas.isNotEmpty && etapasseleccionadas.isEmpty) {
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
              style: TextStyle(fontSize: 18),
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

  bool itsEtapaSeleccionada(EtapasPlagaData e) {
    var index = etapasseleccionadas.indexWhere(
        (element) => element.etapa.idEtapasPlaga == e.idEtapasPlaga);
    return index >= 0;
  }

  Widget buildEtapas() {
    return Column(
        children: plagaconetapas!.etapas.map((e) {
      return Row(
        children: [
          Expanded(
            child: FormBuilderCheckbox(
                name: e.nombreEtapa,
                initialValue: false,
                checkColor: Colors.black,
                activeColor: kblueColor,
                onChanged: (value) {
                  if (value!) {
                    etapasseleccionadas.add(EtapaIndividuosModel(etapa: e));
                  } else {
                    etapasseleccionadas.removeWhere(
                      (element) =>
                          element.etapa.idEtapasPlaga == e.idEtapasPlaga,
                    );
                  }
                  cubit.changeEtapa(etapasseleccionadas);
                  setState(() {});
                },
                validator: (value) {
                  if (etapasseleccionadas.isEmpty) {
                    return "Debe seleccionar una etapa por lo menos";
                  }
                  return null;
                },
                title: Text(
                  e.nombreEtapa,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                )),
          ),
          itsEtapaSeleccionada(e)
              ? Expanded(
                  child: FormBuilderTextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final index = etapasseleccionadas.indexWhere(
                        (element) =>
                            element.etapa.idEtapasPlaga == e.idEtapasPlaga,
                      );
                      if (index >= 0) {
                        etapasseleccionadas[index].individuos =
                            int.tryParse(value ?? '');
                      }
                      cubit.changeEtapa(etapasseleccionadas);
                    },
                    name: e.idEtapasPlaga.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                        labelText: 'Numero de individuos'),
                    validator: (value) => value == null || value == ''
                        ? 'Este campo es requerido'
                        : null,
                  ),
                )
              : const SizedBox()
        ],
      );
    }).toList());
  }

  Widget _numeroIndividuos() {
    return FormBuilderTextField(
      onChanged: (value) {
        cubit.changeNumeroIndividuos(int.tryParse(value ?? ''));
      },
      name: 'individuos',
      keyboardType: TextInputType.number,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      decoration: const InputDecoration(
        label: Text(
          "Numero de individuos",
          style: TextStyle(fontSize: 18),
        ),
        contentPadding: EdgeInsets.only(left: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
        ),
      ),
      validator: (value) =>
          value == null || value == '' ? 'Este campo es requerido' : null,
    );
  }

  Widget _ubicacionDelFoco() {
    return Column(
      children: [
        const SizedBox(height: 15),
        FormBuilderTextField(
          onChanged: (value) => cubit.changeLinea(int.tryParse(value ?? '')),
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
              cubit.changeNumero(int.tryParse(value)!);
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
          cubit.changeOrientacion(value);
        }),
      ],
    );
  }

  Widget _observaciones() {
    return FormBuilderTextField(
      onChanged: (value) {
        cubit.changeObservaciones(value ?? '');
      },
      name: 'observaciones',
      style: const TextStyle(fontSize: 18),
      decoration: const InputDecoration(
        label: Text(
          "Observaciones",
          style: TextStyle(fontSize: 18),
        ),
        contentPadding: EdgeInsets.only(left: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
        ),
      ),
    );
  }
}

//   void registrarPlaga(BuildContext context) async {
//     try {
//       await cubit.insertarCenso(
//         fechacenso,
//       );
//       if (!mounted) return;
//       Navigator.of(context).pop();
//       Navigator.of(context).pop();
//     } catch (e) {
//       registroFallidoToast('pailas');
//     }
//   }
 //   return Column(
  //       children: etapasseleccionadas
  //           .map((e) => Row(
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   const Expanded(child: Text('Etapa: ')),
  //                   Expanded(
  //                     child: Text(
  //                       e.nombreEtapa,
  //                       style: const TextStyle(color: Colors.red),
  //                     ),
  //                   )
  //                 ],
  //               ))
  //           .toList());
  // }

  // Widget buildUbicacionPlaga() {
  //   return FormBuilderRadioGroup<String?>(
  //     key: _radiokey,
  //     name: "tipo",
  //     decoration: const InputDecoration(
  //         labelText: 'Ubicación del foco:',
  //         labelStyle: TextStyle(fontSize: 16)),
  //     onChanged: (e) {
  //       if (e == "lote") {
  //         setState(() {
  //           presencialote = true;
  //           presenciasector = false;
  //           ubicacionfoco = e;
  //           linealimite1 = "0";
  //           linealimite2 = "0";
  //         });
  //       } else if (e == "sector") {
  //         setState(() {
  //           presencialote = false;
  //           presenciasector = true;
  //           ubicacionfoco = e;
  //         });
  //       }
  //       cubit.changePresencia(e!);
  //     },
  //     initialValue: null,
  //     validator: FormBuilderValidators.required(),
  //     options: ubicacionPlaga
  //         .map((lang) => FormBuilderFieldOption(
  //               value: lang,
  //               child: Text(lang),
  //             ))
  //         .toList(growable: false),
  //   );
  // }

  // Widget buildCamposFoco() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: <Widget>[
  //       const SizedBox(height: 10),
  //       Row(
  //         children: <Widget>[
  //           Expanded(child: _buildCantidad('Desde linea')),
  //         ],
  //       ),
  //       const SizedBox(height: 10),
  //       Row(
  //         children: <Widget>[
  //           Expanded(child: _buildCantidad('Hasta linea')),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildCantidad(String campo) {
  //   return TextFormField(
  //     keyboardType: TextInputType.number,
  //     decoration: InputDecoration(
  //       label: Text(
  //         campo,
  //         style: const TextStyle(fontSize: 15),
  //       ),
  //       contentPadding: const EdgeInsets.only(left: 10),
  //       enabledBorder: const OutlineInputBorder(
  //         borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
  //       ),
  //     ),
  //     validator: (value) {
  //       if (utils.isNumeric(value!)) {
  //         return null;
  //       } else {
  //         return 'Este campo es necesario';
  //       }
  //     },
  //     onChanged: (String value) {
  //       setState(() {
  //         if (campo == 'Desde linea') {
  //           linealimite1 = value;
  //           cubit.changeLimite1(int.parse(linealimite1!));
  //         } else {
  //           linealimite2 = value;
  //           cubit.changeLimite2(int.parse(linealimite2!));
  //         }
  //       });
  //     },
  //   );
  // }

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

  // Widget getEtapasSeleccionadas() {
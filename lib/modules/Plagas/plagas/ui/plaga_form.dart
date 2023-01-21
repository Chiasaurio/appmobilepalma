import 'package:apppalma/components/main_button.dart';
import 'package:apppalma/components/toasts/toasts.dart';
import 'package:apppalma/components/widgets/fecha.dart';
import 'package:apppalma/modules/Plagas/cubit/plagas_cubit.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/plagas_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:apppalma/utils/utils.dart' as utils;

class PlagaForm extends StatefulWidget {
  final String nombreLote;
  const PlagaForm({
    Key? key,
    required this.nombreLote,
  }) : super(key: key);
  @override
  State<PlagaForm> createState() => _PlagaFormState();
}

class _PlagaFormState extends State<PlagaForm> {
  PlagaConEtapas? plagaconetapas;
  EtapasPlagaData? etapa;
  List<EtapasPlagaData> etapasseleccionadas = [];
  List<PlagaConEtapas>? plagas;
  bool advertenciaetapa = false;
  Palma? palma;
  DateTime fechacenso =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  String? ubicacionfoco;
  String observacion = '';

  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;
  bool? presencialote;
  bool? presenciasector;
  String? linealimite1;
  String? linealimite2;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final PalmaArguments args = ModalRoute.of(context).settings.arguments;

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.3; //150,
    anchoCard = width;
    margin = anchoCard * 0.04;
    // plagaBloc.addPlagas();

    return Column(children: <Widget>[
      buildPlagasForm(),
      // card(),
      // _buildRegistrarCosecha(context),
      buildRegistarEnfermedad(context),
    ]);
  }

  Widget buildPlagasForm() {
    return Container(
        margin: EdgeInsets.all(margin),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 15),
              buildFecha(),
              const SizedBox(height: 15),
              buildPlaga(),
              const SizedBox(height: 15),
              buildEtapas(),
              const SizedBox(height: 15),
              advertenciaetapa
                  ? const Text('Debe seleccionar una etapa',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.red))
                  : const SizedBox(),
              buildTipo(),
              SizedBox(height: altoCard * 0.1),
              ubicacionfoco == 'sector' ? buildCamposFoco() : const SizedBox(),
              SizedBox(height: altoCard * 0.1),
            ],
          ),
        ));
  }

  Widget buildPlaga() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Seleccione la plaga:',
              style: TextStyle(
                fontSize: 18.0,
              )),
          getPlagas()
        ]);
  }

  Widget getPlagas() {
    return BlocBuilder<PlagasCubit, PlagasState>(builder: (context, state) {
      if (state is PlagasConEtapasLoaded) {
        plagas = state.plagas;
        return _buildPlaga();
      } else {
        return const Text('Hola');
      }
    });
  }

  Widget _buildPlaga() {
    List<DropdownMenuItem<PlagaConEtapas>> getOpcionesDropdown() {
      List<DropdownMenuItem<PlagaConEtapas>> lista = [];
      for (var plagaconetapas in plagas!) {
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
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          elevation: 5,
          isExpanded: true,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          value: plagaconetapas,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
              plagaconetapas = opt;
            });
          },
          validator: (value) =>
              value == null ? 'Este campo es requerido' : null,
        ),
      )
    ]);
  }

  Widget buildEtapas() {
    if (plagaconetapas != null) {
      if (plagaconetapas!.etapas != null) {
        return _buildEtapas();
      }
    } else {
      return const SizedBox();
    }
    return const SizedBox();
  }

  Widget _buildEtapas() {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: const Text('Seleccione la etapa:',
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
            ),
          ),
        ],
      ),
      Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: plagaconetapas!.etapas.map((e) {
              return ListTile(
                  leading: Checkbox(
                    value: checkEtapasSeleccionadas(e),
                    onChanged: (checked) {
                      setState(() {
                        if (checked!) {
                          etapasseleccionadas.add(e);
                        } else {
                          etapasseleccionadas.remove(e);
                        }
                      });
                    },
                  ),
                  title: Text(e.nombreEtapa,
                      style: const TextStyle(fontSize: 20.0)));
            }).toList(),
          ))

      // ListView.builder(
      //   itemCount: plagaconetapas!.etapas.length,
      //   itemBuilder: (context, index) => ListTile(
      //       leading: Checkbox(
      //         value:
      //             checkEtapasSeleccionadas(plagaconetapas!.etapas[index]),
      //         onChanged: (checked) {
      //           setState(() {
      //             if (checked!) {
      //               etapasseleccionadas.add(plagaconetapas!.etapas[index]);
      //             } else {
      //               etapasseleccionadas
      //                   .remove(plagaconetapas!.etapas[index]);
      //             }
      //           });
      //         },
      //       ),
      //       title: Text(plagaconetapas!.etapas[index].nombreEtapa,
      //           style: TextStyle(fontSize: 20.0))),
      // ))
    ]);
  }

  bool checkEtapasSeleccionadas(EtapasPlagaData e) {
    var contain = etapasseleccionadas
        .where((element) => element.nombreEtapa == e.nombreEtapa);
    if (contain.isEmpty) {
      return false;
    }
    return true;
  }

  // Widget _buildEtapas() {
  //   List<Widget> lista = new List<Widget>();
  //   plagaconetapas.etapas.forEach((element) {
  //     Row aux = Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: <Widget>[
  //         Radio(
  //           value: element,
  //           groupValue: etapa,
  //           onChanged: (valor) {
  //             setState(() {
  //               checketapa(valor);
  //               etapa = valor;
  //             });
  //           },
  //         ),
  //         Text(element.nombreEtapa,
  //             textAlign: TextAlign.start,
  //             style: TextStyle(color: Colors.black, fontSize: 16)),
  //       ],
  //     );
  //     lista.add(aux);
  //   });

  //   return Column(children: <Widget>[
  //     Row(
  //       children: <Widget>[
  //         Expanded(
  //           child: Container(
  //             margin: EdgeInsets.all(10),
  //             child: Text('Seleccione la etapa:',
  //                 style: TextStyle(fontSize: 16.0, color: Colors.grey)),
  //           ),
  //         ),
  //       ],
  //     ),
  //     Container(
  //       padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
  //       margin: EdgeInsets.all(5.0),
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Colors.grey),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: lista,
  //       ),
  //     )
  //   ]);
  // }

  Widget buildTipo() {
    return Container(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
        child: Column(
          children: <Widget>[
            Row(
              children: const <Widget>[
                Text('Defina la ubicación del foco:',
                    style: TextStyle(
                      fontSize: 18.0,
                    )),
              ],
            ),
            Row(
              children: <Widget>[_buildTipo()],
            ),
          ],
        ));
  }

  Widget _buildTipo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio<String>(
              value: 'lote',
              groupValue: ubicacionfoco,
              onChanged: (valor) {
                setState(() {
                  presencialote = true;
                  presenciasector = false;
                  ubicacionfoco = valor;
                  linealimite1 = "0";
                  linealimite2 = "0";
                });
              },
            ),
            const Text('Todo el lote',
                style: TextStyle(fontSize: 20.0, color: Colors.black)),
          ],
        ),
        Row(
          children: <Widget>[
            Radio<String>(
              value: 'sector',
              groupValue: ubicacionfoco,
              onChanged: (valor) {
                setState(() {
                  presencialote = false;
                  presenciasector = true;
                  ubicacionfoco = valor;
                });
              },
            ),
            const Text('Por sector',
                style: TextStyle(fontSize: 20.0, color: Colors.black)),
          ],
        ),
      ],
    );
  }

  Widget buildFecha() {
    callback(DateTime f) {
      setState(() {
        fechacenso = f;
      });
    }

    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: FechaWidget(fecha: fechacenso, callback: callback)),
        ],
      )
    ]);
  }

  Widget buildCamposFoco() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: height * 0.0009),
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
      style: const TextStyle(fontSize: 25),
      textAlign: TextAlign.start,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: campo,
        labelStyle: const TextStyle(fontSize: 18),
        // hintText: campo,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      validator: (value) {
        if (utils.isNumeric(value!)) {
          return null;
        } else {
          return 'Este campo es necesario';
        }
      },
      onChanged: (String value) {
        if (campo == 'Desde linea') {
          linealimite1 = value;
        } else {
          linealimite2 = value;
        }
      },
    );
  }

  Widget buildRegistarEnfermedad(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: MainButton(
        text: 'Registrar plaga',
        press: () {
          _submitEnfermedad(context);
        },
      ),
    );
  }

  void _submitEnfermedad(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      if (etapasseleccionadas.isNotEmpty) {
        advertenciaetapa = false;
      } else {
        advertenciaetapa = true;
      }
    }
    if (formKey.currentState!.validate()) {
      if (etapasseleccionadas.isNotEmpty) {
        advertenciaetapa = false;
      } else {
        advertenciaetapa = true;
      }
      if (!advertenciaetapa) {
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
                    const Expanded(child: Text('Plaga: ')),
                    Expanded(
                      child: Text(
                        plagaconetapas!.plaga.nombreComunPlaga,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                etapasseleccionadas.isNotEmpty
                    ? getEtapasSeleccionadas()
                    : SizedBox(height: margin),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Expanded(child: Text('Ubicacion: ')),
                    Expanded(
                      child: ubicacionfoco == 'sector'
                          ? Text(
                              '$linealimite1 - $linealimite2',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          : const Text(
                              'todo el lote',
                              style: TextStyle(
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
                    const Expanded(child: Text('Fecha ')),
                    Expanded(
                      child: Text(
                        DateFormat('yMMMMEEEEd', 'es').format(fechacenso),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
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
                    registrarPlaga(context);
                    // Navigator.popUntil(context, ModalRoute.withName('lote/cosechas'));
                  },
                )
              ]);
        });
  }

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
          presencialote!,
          presenciasector!,
          int.parse(linealimite1!),
          int.parse(linealimite2!),
          observacion,
          plagaconetapas!.plaga.nombreComunPlaga,
          widget.nombreLote,
          etapasseleccionadas);
      if (!mounted) return;
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } catch (e) {
      registroFallidoToast('pailas');
    }
  }
}

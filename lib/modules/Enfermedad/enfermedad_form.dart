import 'package:apppalma/modules/Enfermedad/cubit/enfermedad_cubit.dart';
import 'package:apppalma/modules/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/components/appbar.dart';
import 'package:apppalma/components/toasts/toasts.dart';
import 'package:apppalma/components/widgets/fecha.dart';
import 'package:apppalma/components/widgets/time_widget.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/enfermedades_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnfermedadForm extends StatefulWidget {
  final PalmaArguments palgaArgumentos;
  const EnfermedadForm({
    Key? key,
    required this.palgaArgumentos,
  }) : super(key: key);

  @override
  _EnfermedadFormState createState() => _EnfermedadFormState();
}

class _EnfermedadFormState extends State<EnfermedadForm> {
  late List<EnfermedadConEtapas> enfermedades;
  EnfermedadConEtapas? enfermedadconetapas;
  late EnfermedadConEtapas otraenfermedad;

  Etapa? etapa;
  String? observaciones;
  bool advertenciaetapa = false;
  late Palma palma;
  late DateTime _fechaRegistro;
  TimeOfDay _horaRegistro = TimeOfDay.now();
  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;
  late String nombrelote;
  late String ruta;
  late int numerolinea;
  late int numeroenlinea;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _fechaRegistro = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, _horaRegistro.hour, _horaRegistro.minute);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    nombrelote = widget.palgaArgumentos.nombrelote;
    ruta = '';
    numerolinea = widget.palgaArgumentos.numerolinea;
    numeroenlinea = widget.palgaArgumentos.numeroenlinea;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.3; //150,
    anchoCard = width;
    margin = anchoCard * 0.04;
    otraenfermedad = EnfermedadConEtapas(
        enfermedad: Enfermedade(
            nombreEnfermedad: 'Otra', procedimientoEnfermedad: 'otro'),
        etapas: []);
    // enfermedades.add(otraenfermedad);
    // enfermedadBloc.addEnfermedad();
    // enfermedadBloc.obtenerTodasEnfermedadesConEtapas();

    return Scaffold(
        appBar: AppBarWidget.getAppBar(nombrelote, ruta, context),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            buildEnfermedadForm(),
            // card(),
            SizedBox(height: altoCard * 0.1),
            // _buildRegistrarCosecha(context),
            buildRegistarEnfermedad(context),
          ]),
        ));
  }

  Widget buildEnfermedadForm() {
    return Container(
        margin: const EdgeInsets.all(5.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: altoCard * 0.05),
              buildFecha(),
              const SizedBox(height: 10),
              buildHora(),
              const SizedBox(height: 10),
              buildEnfermedad(),
              buildEtapas(),
              advertenciaetapa
                  ? const Text('Debe seleccionar una etapa',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.red))
                  : const SizedBox(),
              const SizedBox(height: 10),
              buildObservacion(),
            ],
          ),
        ));
  }

  Widget buildFecha() {
    callback(DateTime f) {
      setState(() {
        _fechaRegistro = f;
      });
    }

    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
              child: FechaWidget(fecha: _fechaRegistro, callback: callback)),
        ],
      )
    ]);
  }

  Widget buildHora() {
    callback(TimeOfDay f) {
      setState(() {
        _horaRegistro = f;
      });
    }

    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: HoraWidget(hora: _horaRegistro, callback: callback)),
        ],
      )
    ]);
  }

  Widget buildObservacion() {
    return Row(
      children: <Widget>[
        Expanded(
            child: TextFormField(
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 20),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Observaciones',
                  labelStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                onChanged: (String value) {
                  setState(() {
                    observaciones = value;
                  });
                },
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else if (enfermedadconetapas != null &&
                      enfermedadconetapas!.enfermedad.nombreEnfermedad ==
                          "Otra") {
                    return 'Este campo es necesario';
                  } else {
                    return null;
                  }
                })),
      ],
    );
  }

  Widget buildEnfermedad() {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: const Text('Seleccione la enfermedad:',
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: getEnfermedades(),
          ),
        ],
      )
    ]);
  }

  Widget getEnfermedades() {
    return BlocBuilder<EnfermedadCubit, EnfermedadState>(
      builder: (context, state) {
        if (state is EnfermedadesConEtapasLoaded) {
          enfermedades = state.enfermedades;
          return _buildEnfermedad();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildEnfermedad() {
    List<DropdownMenuItem<EnfermedadConEtapas>> getOpcionesDropdown() {
      List<DropdownMenuItem<EnfermedadConEtapas>> lista = [];
      enfermedades.forEach((ece) {
        lista.add(DropdownMenuItem(
          child: Text(ece.enfermedad.nombreEnfermedad),
          value: ece,
        ));
      });
      return lista;
    }

    return Row(children: <Widget>[
      // Icon(Icons.select_all),
      Expanded(
        child: DropdownButtonFormField<EnfermedadConEtapas>(
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
          value: enfermedadconetapas,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
              enfermedadconetapas = opt!;
              advertenciaetapa = false;
            });
          },
          validator: (value) =>
              value == null ? 'Este campo es requerido' : null,
        ),
      )
    ]);
  }

  Widget buildEtapas() {
    if (enfermedadconetapas != null) {
      if (enfermedadconetapas!.etapas.isNotEmpty) {
        return _buildEtapas();
      } else {
        return const SizedBox();
      }
    }
    return const SizedBox();
  }

  Widget _buildEtapas() {
    List<Widget> lista = [];
    for (var element in enfermedadconetapas!.etapas) {
      Row aux = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio<Etapa>(
            value: element,
            groupValue: etapa,
            onChanged: (valor) {
              setState(() {
                etapa = valor!;
              });
            },
          ),
          Text(element.nombreEtapa,
              textAlign: TextAlign.start,
              style: const TextStyle(color: Colors.black, fontSize: 16)),
        ],
      );
      lista.add(aux);
    }

    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: const Text('Seleccione la etapa:',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey)),
            ),
          ),
        ],
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 0),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: advertenciaetapa
              ? Border.all(color: Colors.red)
              : Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: lista,
        ),
      )
    ]);
  }

  Widget buildRegistarEnfermedad(BuildContext context) {
    return ElevatedButton(
      child: const Text(
        'Registrar enfermedad',
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      // color: Colors.blue[50],
      // shape: BeveledRectangleBorder(),
      // disabledElevation: 3.0,
      onPressed: () {
        _submitEnfermedad(context);
      },
    );
  }

  void _submitEnfermedad(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    if (formKey.currentState!.validate()) {
      if (enfermedadconetapas != null) {
        if (enfermedadconetapas!.etapas.isNotEmpty && etapa == null) {
          setState(() {
            advertenciaetapa = true;
          });
        } else {
          setState(() {
            advertenciaetapa = false;
          });
          _confirmacionAlerta();
        }
      }
    }
  }

  void _confirmacionAlerta() {
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
                    const Expanded(child: Text('Enfermedad: ')),
                    Expanded(
                      child: Text(
                        enfermedadconetapas!.enfermedad.nombreEnfermedad,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(height: margin),
                etapa != null
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Expanded(child: Text('Etapa: ')),
                          Expanded(
                            child: Text(
                              etapa!.nombreEtapa,
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                      )
                    : const SizedBox(),
                SizedBox(height: margin),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Expanded(child: Text('Observaciones: ')),
                    Expanded(
                      child: Text(
                        observaciones ?? 'no hay observaciones',
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
                    const Expanded(child: Text('Linea palma: ')),
                    Expanded(
                      child: Text(
                        numerolinea.toString(),
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
                    const Expanded(child: Text('Numero palma: ')),
                    Expanded(
                      child: Text(
                        numeroenlinea.toString(),
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
                    registrarEnfermedad(context);
                  },
                )
              ]);
        });
  }

  void registrarEnfermedad(BuildContext context) async {
    try {
      BlocProvider.of<PalmaCubit>(context).insertarPalmaConEnfermedad(
          nombrelote,
          numerolinea,
          numeroenlinea,
          _fechaRegistro,
          enfermedadconetapas!.enfermedad.nombreEnfermedad,
          etapa?.id,
          enfermedadconetapas!.enfermedad.procedimientoEnfermedad,
          observaciones ?? '');
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    } catch (e) {
      // Navigator.of(context).popUntil(ModalRoute.withName('lote/censo'));
      registroFallidoToast('pailas');
    }
  }
}

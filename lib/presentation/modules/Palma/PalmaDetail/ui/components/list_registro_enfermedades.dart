import 'dart:io';
import 'package:apppalma/domain/palma/models/palma_con_procesos_model.dart';
import 'package:flutter/material.dart';

class RegistroEnfermedadesList extends StatefulWidget {
  final List<RegistroEnfermedadDatos> registros;
  const RegistroEnfermedadesList({super.key, required this.registros});

  @override
  State<RegistroEnfermedadesList> createState() =>
      _RegistroEnfermedadesListState();
}

class _RegistroEnfermedadesListState extends State<RegistroEnfermedadesList> {
  late List<RegistroEnfermedadDatos> _registros;
  @override
  void initState() {
    _registros = widget.registros;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _renderSteps();
  }

  Widget _renderSteps() {
    return ExpansionPanelList(
      expandedHeaderPadding: const EdgeInsets.all(0),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _registros[index] =
              _registros[index].changeExpanded(expanded: !isExpanded);
        });
      },
      children: _registros.map<ExpansionPanel>((RegistroEnfermedadDatos val) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(val.enfermedad!.nombreEnfermedad),
            );
          },
          body: Column(
            children: [
              Row(
                children: val.imagenes
                    .map((e) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          height: 100,
                          width: 90,
                          child: Image.file(File(e)),
                        ))
                    .toList(),
              ),
              informacionProcedimiento(val),
              val.registrotratamiento != null
                  ? ListTile(
                      title: RichText(
                        text: TextSpan(
                          text: 'Tratamiento: ',
                          style: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    '${val.registrotratamiento!.descripcionProcedimiento}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    )
                  : ListTile(
                      title: RichText(
                        text: const TextSpan(
                          text: 'Tratamiento: ',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'no se ha aplicado un tratamiento',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
          isExpanded: val.isExpanded,
        );
      }).toList(),
    );
  }

  Widget informacionProcedimiento(RegistroEnfermedadDatos val) {
    if (val.etapa != null) {
      return Column(
        children: [
          ListTile(
            title: RichText(
              text: TextSpan(
                text: 'Etapa: ',
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text: val.etapa!.nombreEtapa,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                text: 'Procedimiento: ',
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text: val.etapa!.procedimientoEtapa,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return ListTile(
        title: RichText(
          text: TextSpan(
            text: 'Procedimiento: ',
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                  text: val.enfermedad!.procedimientoEnfermedad,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
    }
  }
}

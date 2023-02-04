import 'package:flutter/material.dart';

import '../../registrospalma.dart';

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
              val.etapa != null
                  ? ListTile(
                      title: RichText(
                        text: TextSpan(
                          text: 'Procedimiento: ',
                          style: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: val.etapa!.procedimientoEtapa,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    )
                  : ListTile(
                      title: RichText(
                        text: TextSpan(
                          text: 'Procedimiento: ',
                          style: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                text: val.enfermedad!.procedimientoEnfermedad,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
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
}

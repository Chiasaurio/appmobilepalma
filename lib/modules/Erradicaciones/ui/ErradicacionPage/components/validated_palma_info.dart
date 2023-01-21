import 'package:apppalma/moor/tables/palmas_table.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PalmaValidadaInfo extends StatelessWidget {
  PalmaValidadaInfo({Key? key, required this.palma}) : super(key: key);

  final f = DateFormat.yMMMMd('es');
  final PalmaValidada palma;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            palma.enfermedad != null ? enfermedadInfo() : const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Estado palma:',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                Flexible(
                  child: Text(
                    ' ${palma.palma.estadopalma}',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            const SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
    );
  }

  enfermedadInfo() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Fecha registro:',
              style: TextStyle(fontSize: 16.0, color: Colors.grey)),
          Text(
            f.format(palma.registroEnfermedad!.fechaRegistro),
            style: const TextStyle(color: Colors.black, fontSize: 15),
            textAlign: TextAlign.start,
          ),
        ],
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     const Text('Linea:     ',
      //         style: TextStyle(fontSize: 16.0, color: Colors.grey)),
      //     Text(
      //       '${palma.palma.numerolinea}',
      //       style: const TextStyle(color: Colors.black, fontSize: 18),
      //       textAlign: TextAlign.start,
      //     ),
      //   ],
      // ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     const Text('Numero:    ',
      //         style: TextStyle(fontSize: 16.0, color: Colors.grey)),
      //     Text(
      //       '${palma.palma.numeroenlinea}',
      //       style: const TextStyle(color: Colors.black, fontSize: 18),
      //       textAlign: TextAlign.start,
      //     ),
      //   ],
      // ),
      const SizedBox(
        width: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Enfermedad:',
              style: TextStyle(fontSize: 16.0, color: Colors.grey)),
          Text(
            ' ${palma.enfermedad!.nombreEnfermedad}',
            style: const TextStyle(color: Colors.orange, fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ],
      ),
      const SizedBox(
        width: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          palma.etapa != null
              ? const Text('Etapa:',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey))
              : const SizedBox(),
          palma.etapa != null
              ? Text(
                  ' ${palma.etapa!.nombreEtapa}',
                  style: const TextStyle(color: Colors.orange, fontSize: 16),
                  textAlign: TextAlign.start,
                )
              : const SizedBox(),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Procedimiento:',
              style: TextStyle(fontSize: 16.0, color: Colors.grey)),
          Flexible(
            child: Text(
              ' ${palma.enfermedad!.procedimientoEnfermedad}',
              style: const TextStyle(color: Colors.red, fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      )
    ]);
  }
}

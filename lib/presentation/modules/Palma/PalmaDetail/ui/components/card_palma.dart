import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CardPalma extends StatelessWidget {
  final Palma palma;
  const CardPalma({super.key, required this.palma});

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Linea palma: ',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                Flexible(
                  child: Text(
                    palma.numerolinea.toString(),
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Numero palma: ',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                Flexible(
                  child: Text(
                    palma.numeroenlinea.toString(),
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Estado palma: ',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey)),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        crearEtiqueta(),
                        Flexible(
                          child: Text(
                            palma.estadopalma,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }

  Widget crearEtiqueta() {
    return Container(
      width: 18,
      height: 18,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10, 0.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: EstadosPalma.etiquetacolor[palma.estadopalma] ?? Colors.purple,
      ),
    );
  }
}

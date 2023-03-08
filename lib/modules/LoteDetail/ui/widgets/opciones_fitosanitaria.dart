import 'package:flutter/material.dart';

import 'package:apppalma/data/moor/tables/lotes_table.dart';
import 'opcion_item.dart';

class OpcionesFitosanitaria extends StatelessWidget {
  final LoteWithProcesos lote;
  const OpcionesFitosanitaria({super.key, required this.lote});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(children: [
        OpcionItem(
            object: lote.cosecha,
            ruta: '/lote/cosechas',
            nombreLote: lote.lote.nombreLote,
            textWithObject: 'Continuar cosecha',
            textWithoutObject: 'Nueva cosecha'),
        const SizedBox(
          height: 15,
        ),
        OpcionItem(
            object: lote.poda,
            ruta: '/lote/podas',
            nombreLote: lote.lote.nombreLote,
            textWithObject: 'Continuar poda',
            textWithoutObject: 'Nueva poda'),
        const SizedBox(
          height: 15,
        ),
        OpcionItem(
            object: lote.plateo,
            ruta: '/lote/plateos',
            nombreLote: lote.lote.nombreLote,
            textWithObject: 'Continuar plateo',
            textWithoutObject: 'Nueva plateo'),
      ]),
    );
  }
}

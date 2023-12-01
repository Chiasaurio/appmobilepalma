import 'package:flutter/material.dart';

import 'package:apppalma/data/moor/tables/lotes_table.dart';
import 'opcion_item.dart';
import 'opcion_green_item.dart';

class OpcionesProductiva extends StatelessWidget {
  final LoteWithProcesos lote;
  const OpcionesProductiva({super.key, required this.lote});

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
        const SizedBox(
          height: 15,
        ),
        OpcionItem(
            object: lote.fertilizacion,
            ruta: '/lote/fertilizaciones',
            nombreLote: lote.lote.nombreLote,
            textWithObject: 'Continuar fertilización',
            textWithoutObject: 'Nueva fertilización'),
        const SizedBox(
          height: 15,
        ),
        OpcionGreenItem(
          ruta: '/lote/censoproductivo',
          nombreLote: lote.lote.nombreLote,
          text: 'Censo productivo',
        ),
      ]),
    );
  }
}

import 'package:apppalma/constants.dart';
import 'package:apppalma/modules/LoteDetail/ui/widgets/expansion_tile.dart';
import 'package:flutter/material.dart';

import '../../../moor/tables/lotes_table.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.lote}) : super(key: key);
  final LoteWithProcesos lote;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String nombrelote = '';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ExpansionTileWidget(
          text: 'Gestión productiva',
          list: <Widget>[
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ElevatedButtonWidget(
            //         object: widget.lote.cosecha,
            //         ruta: '/lote/cosechas',
            //         nombreLote: nombrelote,
            //         textWithObject: 'Continuar cosecha',
            //         textWithoutObject: 'Nueva cosecha'),
            //     ElevatedButtonWidget(
            //         object: widget.lote.poda,
            //         ruta: '/lote/podas',
            //         nombreLote: nombrelote,
            //         textWithObject: 'Continuar poda',
            //         textWithoutObject: 'Nueva poda'),
            //     ElevatedButtonWidget(
            //         object: widget.lote.plateo,
            //         ruta: '/lote/plateos',
            //         nombreLote: nombrelote,
            //         textWithObject: 'Continuar plateo',
            //         textWithoutObject: 'Nuevo plateo'),
            //   ],
            // ),

            DynamicTile(
                object: widget.lote.cosecha,
                ruta: '/lote/cosechas',
                nombreLote: nombrelote,
                textWithObject: 'Continuar cosecha',
                textWithoutObject: 'Nueva cosecha'),
            DynamicTile(
                object: widget.lote.poda,
                ruta: '/lote/podas',
                nombreLote: nombrelote,
                textWithObject: 'Continuar poda',
                textWithoutObject: 'Nueva poda'),
            DynamicTile(
                object: widget.lote.plateo,
                ruta: '/lote/plateos',
                nombreLote: nombrelote,
                textWithObject: 'Continuar plateo',
                textWithoutObject: 'Nueva plateo'),
          ],
        ),
        ExpansionTileWidget(
          text: 'Gestión fitosanitaria',
          list: <Widget>[
            Tile(
                onTap: () {
                  Navigator.pushNamed(context, '/lote/palmas',
                      arguments: nombrelote);
                },
                text: 'Ver palmas'),
            Tile(
                onTap: () {
                  Navigator.pushNamed(context, '/lote/censo',
                      arguments: nombrelote);
                },
                text: 'Enfermedades'),
            Tile(
                onTap: () {
                  Navigator.pushNamed(context, '/lote/aplicaciones',
                      arguments: nombrelote);
                },
                text: 'Plagas'),
          ],
        )
      ],
    ));
  }
}

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
    required this.nombreLote,
    required this.textWithoutObject,
    required this.textWithObject,
    this.object,
    required this.ruta,
  }) : super(key: key);

  final String nombreLote;
  final String textWithoutObject;
  final String textWithObject;
  final dynamic object;
  final String ruta;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, ruta, arguments: nombreLote);
      },
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 14),
        ),
        backgroundColor: object != null
            ? MaterialStateProperty.all(kYellowColor)
            : MaterialStateProperty.all(kBackgroundColor),
        maximumSize: MaterialStateProperty.all(const Size(95, 40)),
        minimumSize: MaterialStateProperty.all(const Size(95, 40)),
      ),
      // child: Icon(Icons.family_restroom),
      child: Align(
        alignment: Alignment.center,
        child: object != null
            ? Text(
                textWithObject,
                textAlign: TextAlign.center,
              )
            : Text(
                textWithoutObject,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}

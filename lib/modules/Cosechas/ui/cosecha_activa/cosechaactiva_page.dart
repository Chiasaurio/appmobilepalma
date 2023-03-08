import 'package:apppalma/modules/Cosechas/ui/registrar_cosecha_diaria/registrar_cosecha_page.dart';
import 'package:apppalma/components/secondary_button.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CosechaActivaVista extends StatefulWidget {
  final Cosecha cosecha;
  const CosechaActivaVista({Key? key, required this.cosecha}) : super(key: key);
  @override
  State<CosechaActivaVista> createState() => _CosechaActivaVistaState();
}

class _CosechaActivaVistaState extends State<CosechaActivaVista> {
  late Cosecha cosecha;
  final f = DateFormat('yyyy-MM-dd');

  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double separacion;
  late double margin;
  late String nombrelote;
  @override
  void initState() {
    cosecha = widget.cosecha;
    nombrelote = cosecha.nombreLote;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cosecha = widget.cosecha;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.3; //150,
    anchoCard = width * 0.9;
    margin = anchoCard * 0.04;

    return _buildDetallesCosecha();
  }

  Widget _buildDetallesCosecha() {
    return Container(
        margin: EdgeInsets.all(margin),
        child: Column(children: <Widget>[
          _buildTitulo(),
          _buildCosechaCard(context),
          SizedBox(height: altoCard * 0.1),
          _buildRegistrarCosecha(context),
        ]));
  }

  Widget _buildTitulo() {
    return Container(
      margin: EdgeInsets.all(margin),
      child: Row(children: const <Widget>[
        Expanded(
          child: Text('Cosecha activa',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22, /*fontWeight: FontWeight.bold*/
              )),
        ),
      ]),
    );
  }

  Widget _buildCosechaCard(BuildContext context) {
    return Card(
        elevation: 2.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
            width: anchoCard,
            padding: EdgeInsets.all(margin),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Text(
                          'Fecha de inicio ',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          f.format(cosecha.fechaIngreso),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.fromLTRB(anchoCard * 0.3, 0.0, 0.0, 0.0),
                      child: TextButton(
                        onPressed: () {
                          _opcionesBottomSheet(context);
                        },
                        child: const Icon(Icons.more_vert),
                      ),
                    )
                  ],
                ),
                SizedBox(height: margin),
                Padding(
                    padding:
                        EdgeInsets.fromLTRB(anchoCard * 0.3, 0.0, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const Text(
                          'Total racimos',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const SizedBox(height: 5.0),
                        Text(cosecha.cantidadRacimos.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20)),
                        const Text(
                          'Total kilos',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                          textAlign: TextAlign.end,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          cosecha.kilos.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    )),
              ],
            )));
  }

  Widget _buildRegistrarCosecha(BuildContext context) {
    return SecondaryButton(
        text: 'Registrar cosecha diaria',
        press: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CosechaDiariaPage(cosecha: cosecha)));
        });
  }

  void _opcionesBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: altoCard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  contentPadding: const EdgeInsets.all(10.0),
                  // leading: Icon(Icons.storage),
                  title: const Text('Ver registros de cosecha',
                      textAlign: TextAlign.center),
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/lote/cosechas/registrocosechas',
                  ),
                ),
                const Divider(),
                ListTile(
                    contentPadding: const EdgeInsets.all(10.0),
                    // leading: Icon(Icons.save_alt),
                    title: const Text('Finalizar cosecha',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(
                          context, '/lote/cosechas/finalizarcosecha',
                          arguments:
                              CosechaDiariaArguments(nombrelote, cosecha));
                    })
              ],
            ),
          );
        });
  }
}

class CosechaDiariaArguments {
  final String nombrelote;
  final Cosecha cosecha;

  CosechaDiariaArguments(this.nombrelote, this.cosecha);
}

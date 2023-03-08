import 'package:apppalma/components/secondary_button.dart';
import 'package:apppalma/modules/Podas/ui/registrar_poda_diario/registrar_poda_page.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PodaActivaPage extends StatefulWidget {
  final Poda poda;
  const PodaActivaPage({Key? key, required this.poda}) : super(key: key);

  @override
  State<PodaActivaPage> createState() => _PodaActivaPageState();
}

class _PodaActivaPageState extends State<PodaActivaPage> {
  late Poda poda;
  final f = DateFormat('yyyy-MM-dd');

  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double separacion;
  late double margin;
  late String nombrelote;

  @override
  Widget build(BuildContext context) {
    poda = widget.poda;
    nombrelote = poda.nombreLote;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.3; //150,
    anchoCard = width * 0.9;
    margin = anchoCard * 0.04;

    return _buildDetallespoda();
  }

  Widget _buildDetallespoda() {
    return Container(
        margin: EdgeInsets.all(margin),
        child: Column(children: <Widget>[
          _buildTitulo(),
          _buildpodaCard(),
          SizedBox(height: altoCard * 0.2),
          _buildRegistrarPoda(context),
        ]));
  }

  Widget _buildTitulo() {
    return Container(
      margin: EdgeInsets.all(margin),
      child: Row(children: const <Widget>[
        Expanded(
          child: Text('Poda activa',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22, /*fontWeight: FontWeight.bold*/
              )),
        ),
      ]),
    );
  }

  Widget _buildpodaCard() {
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
                        Text(
                          f.format(poda.fechaIngreso),
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
                        const SizedBox(height: 5.0),
                        const Text(
                          'Palmas plateadas',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                          textAlign: TextAlign.end,
                        ),
                        Text(poda.cantidadPodada.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20)),
                      ],
                    )),
              ],
            )));
  }

  Widget _buildRegistrarPoda(BuildContext context) {
    return SecondaryButton(
        text: 'Registrar poda diaria',
        press: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PodaDiariaPage(poda: poda)));
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
                  title: const Text('Ver registros de poda',
                      textAlign: TextAlign.center),
                  onTap: () => Navigator.pushNamed(
                      context, '/lote/podas/registropodas',
                      arguments: poda),
                ),
                const Divider(),
                ListTile(
                  contentPadding: const EdgeInsets.all(10.0),
                  // leading: Icon(Icons.save_alt),
                  title: const Text('Finalizar poda',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red)),
                  onTap: () => Navigator.pushNamed(
                      context, '/lote/podas/finalizarpoda',
                      arguments: poda),
                )
              ],
            ),
          );
        });
  }
}

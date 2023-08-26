import 'package:apppalma/presentation/components/secondary_button.dart';
import 'package:apppalma/presentation/modules/Plateos/cubit/plateos_cubit.dart';
import 'package:apppalma/presentation/modules/Plateos/ui/registrar_plateo_diario/registrar_plateo_page.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/utils/confirmacion_alerta.dart';
import 'package:apppalma/utils/recargar_lote_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PlateoActivoVista extends StatefulWidget {
  final Plateo plateo;
  final int totalPalmas;
  const PlateoActivoVista(
      {Key? key, required this.plateo, required this.totalPalmas})
      : super(key: key);
  @override
  State<PlateoActivoVista> createState() => _PlateoActivoVistaState();
}

class _PlateoActivoVistaState extends State<PlateoActivoVista> {
  late Plateo plateo;
  final f = DateFormat('yyyy-MM-dd');

  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double separacion;
  late double margin;
  late String nombrelote;
  late DateTime fechasalida;
  TimeOfDay horaSalida = TimeOfDay.now();

  @override
  void initState() {
    fechasalida = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, horaSalida.hour, horaSalida.minute);
    plateo = widget.plateo;
    nombrelote = plateo.nombreLote;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    plateo = widget.plateo;
    nombrelote = plateo.nombreLote;

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.3; //150,
    anchoCard = width * 0.9;
    margin = anchoCard * 0.04;

    return _buildDetallesPlateo();
  }

  Widget _buildDetallesPlateo() {
    return Container(
        margin: EdgeInsets.all(margin),
        child: Column(children: <Widget>[
          _buildTitulo(),
          _buildPlateoCard(),
          SizedBox(height: altoCard * 0.2),
          _buildRegistrarPlateo(context),
        ]));
  }

  Widget _buildTitulo() {
    return Container(
      margin: EdgeInsets.all(margin),
      child: const Row(children: <Widget>[
        Expanded(
          child: Text('Plateo activo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22, /*fontWeight: FontWeight.bold*/
              )),
        ),
      ]),
    );
  }

  Widget _buildPlateoCard() {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Fecha de inicio ',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text(
                          f.format(plateo.fechaIngreso),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 5.0),
                    const Text(
                      'Total palmas',
                      style: TextStyle(color: Colors.green, fontSize: 16),
                      textAlign: TextAlign.end,
                    ),
                    Text(widget.totalPalmas.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 5.0),
                        const Text(
                          'Restantes',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                          textAlign: TextAlign.end,
                        ),
                        Text(
                            (widget.totalPalmas - plateo.cantidadPlateada)
                                .toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20)),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          const SizedBox(height: 5.0),
                          const Text(
                            'Plateadas',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                            textAlign: TextAlign.end,
                          ),
                          Text(plateo.cantidadPlateada.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  Widget _buildRegistrarPlateo(BuildContext context) {
    return SecondaryButton(
        text: 'Registrar plateo diario',
        press: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlateoDiarioPage(plateo: plateo)));
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
                  title: const Text('Ver registros de plateo',
                      textAlign: TextAlign.center),
                  onTap: () => Navigator.pushNamed(
                      context, '/lote/plateos/registroplateos',
                      arguments: plateo),
                ),
                const Divider(),
                ListTile(
                    contentPadding: const EdgeInsets.all(10.0),
                    title: const Text('Finalizar plateo',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red)),
                    onTap: () {
                      ConfirmacionAlerta(
                              '¿Realmente desea finalizar el plateo?')
                          .confirmacionAlerta(context, () {
                        final state =
                            BlocProvider.of<PlateosCubit>(context).state;
                        BlocProvider.of<PlateosCubit>(context)
                            .finalizarPlateo(state.plateo!, fechasalida);
                        recargarLote(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                    })
              ],
            ),
          );
        });
  }
}

class PlateoDiarioArguments {
  final String nombrelote;
  final Plateo plateo;

  PlateoDiarioArguments(this.nombrelote, this.plateo);
}

 // Widget _buildTotalPlateos(){
  //   return Card(
  //     elevation: 8.0,
  //     margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  //     child: Container(
  //       padding: EdgeInsets.fromLTRB(15.0, 10.0, margin*2, 10.0),
  //       decoration: BoxDecoration(color: Colors.lime[100]),
  //       child:  Row(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: <Widget>[
  //           Container(
  //             child: Expanded(
  //               child:Text('Total palmas plateadas :', style: TextStyle(color: Colors.black, fontSize: 20),),
  //             ),
  //           ),
  //           Text( plateo.cantidadPlateada.toString(), style: TextStyle(color: Colors.black, fontSize: 25), textAlign: TextAlign.center,)
  //         ],
  //       ),
  //     )
  //   );          
  // }

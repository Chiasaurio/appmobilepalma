import 'package:apppalma/presentation/components/secondary_button.dart';
import 'package:apppalma/presentation/modules/Fertilizaciones/cubit/fertilizaciones_cubit.dart';
import 'package:apppalma/presentation/modules/Fertilizaciones/ui/registrar_fertilizacion_diaria/registrar_fertilizaciones_page.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/utils/confirmacion_alerta.dart';
import 'package:apppalma/utils/recargar_lote_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FertilizacionActivaVista extends StatefulWidget {
  final Fertilizacione fertilizacion;
  final int totalPalmas;
  const FertilizacionActivaVista(
      {Key? key, required this.fertilizacion, required this.totalPalmas})
      : super(key: key);
  @override
  State<FertilizacionActivaVista> createState() =>
      _FertilizacionActivaVistaState();
}

class _FertilizacionActivaVistaState extends State<FertilizacionActivaVista> {
  late Fertilizacione fertilizacion;
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
    fertilizacion = widget.fertilizacion;
    nombrelote = fertilizacion.nombreLote;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fertilizacion = widget.fertilizacion;
    nombrelote = fertilizacion.nombreLote;

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
          _buildFertilizacionCard(),
          SizedBox(height: altoCard * 0.2),
          _buildRegistrarFertilizacion(context),
        ]));
  }

  Widget _buildTitulo() {
    return Container(
      margin: EdgeInsets.all(margin),
      child: const Row(children: <Widget>[
        Expanded(
          child: Text('Fertilización activa',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22, /*fontWeight: FontWeight.bold*/
              )),
        ),
      ]),
    );
  }

  Widget _buildFertilizacionCard() {
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
                          f.format(fertilizacion.fechaIngreso),
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
                            (widget.totalPalmas -
                                    fertilizacion.cantidadFertilizada)
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
                            'Fertilizadas',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                            textAlign: TextAlign.end,
                          ),
                          Text(fertilizacion.cantidadFertilizada.toString(),
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

  Widget _buildRegistrarFertilizacion(BuildContext context) {
    return SecondaryButton(
        text: 'Registrar fertilización diaria',
        press: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FertilizacionDiariaPage(fertilizacion: fertilizacion)));
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
                const ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  title: Text('Ver registros de fertilización',
                      textAlign: TextAlign.center),
                  // onTap: () => Navigator.pushNamed(
                  //     context, '/lote/plateos/registroplateos',
                  //     arguments: plateo),
                ),
                const Divider(),
                ListTile(
                    contentPadding: const EdgeInsets.all(10.0),
                    title: const Text('Finalizar plateo',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red)),
                    onTap: () {
                      ConfirmacionAlerta(
                              '¿Realmente desea finalizar la fertilizacion?')
                          .confirmacionAlerta(context, () {
                        final state =
                            BlocProvider.of<FertilizacionCubit>(context).state;
                        BlocProvider.of<FertilizacionCubit>(context)
                            .finalizarFertilizacion(
                                state.fertilizacion!, fechasalida);
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

import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/components/main_button.dart';
import 'package:apppalma/components/widgets/fecha.dart';
import 'package:apppalma/modules/Podas/cubit/podas_cubit.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/utils/confirmacion_alerta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/recargar_lote_detail.dart';

class FinalizarPodaPage extends StatefulWidget {
  final String routeName;

  const FinalizarPodaPage({
    Key? key,
    required this.routeName,
  }) : super(key: key);
  @override
  State<FinalizarPodaPage> createState() => _FinalizarPodaPageState();
}

class _FinalizarPodaPageState extends State<FinalizarPodaPage> {
  late DateTime fechasalida;
  TimeOfDay horaSalida = TimeOfDay.now();

  @override
  void initState() {
    fechasalida = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, horaSalida.hour, horaSalida.minute);
    super.initState();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Plateo? plateo;

  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.3; //150,
    anchoCard = width;
    margin = anchoCard * 0.04;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          HeaderApp(ruta: widget.routeName),
          _buildFinalizarPoda(context),
        ],
      ),
    ));
  }

  Widget _buildFinalizarPoda(BuildContext context) {
    callback(DateTime fecha) {
      setState(() {
        fechasalida = fecha;
      });
    }

    return Container(
        height: height * 0.5,
        margin: EdgeInsets.all(margin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: anchoCard,
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0, 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Expanded(
                      child: Text('Ingrese la fecha de salida del lote',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20, /*fontWeight: FontWeight.bold*/
                          )),
                    ),
                  ]),
            ),
            SizedBox(height: altoCard * 0.1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Fecha de salida',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                const SizedBox(
                  height: 20,
                ),
                FechaWidget(fecha: fechasalida, callback: callback),
              ],
            ),
            SizedBox(height: altoCard * 0.3),
            MainButton(
              text: 'Finalizar poda',
              press: () {
                ConfirmacionAlerta().confirmacionAlerta(context, () {
                  final state = BlocProvider.of<PodasCubit>(context).state;
                  BlocProvider.of<PodasCubit>(context)
                      .finalizarPoda(state.poda!, fechasalida);
                  recargarLote(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  // Navigator.popUntil(
                  //     context, ModalRoute.withName('/lote/cosechas'));
                });
              },
            ),
          ],
        ));
  }
}

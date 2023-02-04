import 'package:apppalma/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/components/main_button.dart';
import 'package:apppalma/components/widgets/fecha.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/utils/confirmacion_alerta.dart';
import 'package:apppalma/utils/recargar_lote_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinalizarCosechaPage extends StatefulWidget {
  final String routeName;

  const FinalizarCosechaPage({Key? key, required this.routeName})
      : super(key: key);
  @override
  State<FinalizarCosechaPage> createState() => _FinalizarCosechaPageState();
}

class _FinalizarCosechaPageState extends State<FinalizarCosechaPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Cosecha? cosecha;
  late DateTime fechasalida;
  TimeOfDay horaSalida = TimeOfDay.now();

  @override
  void initState() {
    fechasalida = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, horaSalida.hour, horaSalida.minute);
    super.initState();
  }

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
          _buildFinalizarCosecha(context),
        ],
      ),
    ));
  }

  Widget _buildFinalizarCosecha(BuildContext context) {
    callback(DateTime fecha) {
      setState(() {
        fechasalida = fecha;
      });
    }

    return Container(
        height: height * 0.5,
        margin: EdgeInsets.all(margin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Ingrese la fecha de salida del lote',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20, /*fontWeight: FontWeight.bold*/
                )),
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
              text: 'Finalizar cosecha',
              press: () {
                ConfirmacionAlerta().confirmacionAlerta(context, () {
                  final state = BlocProvider.of<CosechaCubit>(context).state;
                  BlocProvider.of<CosechaCubit>(context)
                      .finalizarCosecha(state.cosecha!, fechasalida);
                  recargarLote(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  // Navigator.popUntil(
                  //     context, ModalRoute.withName('/lote/cosechas'));
                });
                // _confimarcionAlerta(context);
                // Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}

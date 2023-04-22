import 'package:apppalma/presentation/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/presentation/components/main_button.dart';
import 'package:apppalma/presentation/components/widgets/fecha.dart';
import 'package:apppalma/utils/recargar_lote_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NuevaCosechaPage extends StatefulWidget {
  final String nombrelote;
  const NuevaCosechaPage({Key? key, required this.nombrelote})
      : super(key: key);
  @override
  State<NuevaCosechaPage> createState() => _NuevaCosechaPageState();
}

class _NuevaCosechaPageState extends State<NuevaCosechaPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late DateTime fecha;

  TimeOfDay horaSalida = TimeOfDay.now();
  @override
  void initState() {
    fecha = DateTime(DateTime.now().year, DateTime.now().month,
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

    return buildNuevaCosechaForm();
  }

  Widget buildNuevaCosechaForm() {
    return Container(
        height: altoCard,
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
        margin: const EdgeInsets.all(10),
        child: Form(
            key: formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: altoCard * 0.05),
                  buildFecha(),
                  SizedBox(height: altoCard * 0.1),
                  botonNuevaCosecha(),
                ])));
  }

  Widget buildFecha() {
    callback(DateTime f) {
      setState(() {
        fecha = f;
      });
    }

    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: FechaWidget(fecha: fecha, callback: callback)),
        ],
      )
    ]);
  }

  Widget botonNuevaCosecha() {
    return MainButton(
        text: 'Comenzar cosecha',
        press: () {
          _submit();
        });
  }

  void _submit() {
    BlocProvider.of<CosechaCubit>(context)
        .comenzarNuevaCosecha(widget.nombrelote, fecha);
    //Recargar lista de lotes
    recargarLote(context);
  }
}

// import 'package:apppalma/presentation/components/main_button.dart';
// import 'package:apppalma/presentation/components/widgets/fecha.dart';
// import 'package:apppalma/presentation/modules/Plateos/cubit/plateos_cubit.dart';
// import 'package:apppalma/utils/recargar_lote_detail.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NuevoPlateoView extends StatefulWidget {
//   final String nombrelote;
//   const NuevoPlateoView({Key? key, required this.nombrelote}) : super(key: key);

//   @override
//   State<NuevoPlateoView> createState() => _NuevoPlateoViewState();
// }

// class _NuevoPlateoViewState extends State<NuevoPlateoView> {
//   late DateTime fecha;

//   TimeOfDay horaSalida = TimeOfDay.now();
//   @override
//   void initState() {
//     fecha = DateTime(DateTime.now().year, DateTime.now().month,
//         DateTime.now().day, horaSalida.hour, horaSalida.minute);
//     super.initState();
//   }

//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   late double width;
//   late double height;
//   late double altoCard;
//   late double anchoCard;
//   late double separacion;
//   late double margin;
//   late String nombrelote;

//   @override
//   Widget build(BuildContext context) {
//     nombrelote = widget.nombrelote;
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//     altoCard = height * 0.3; //150,
//     anchoCard = width;
//     margin = anchoCard * 0.04;

//     return buildNuevaPodaForm();
//   }

//   Widget buildNuevaPodaForm() {
//     return Container(
//         height: altoCard,
//         padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
//         margin: const EdgeInsets.all(10),
//         child: Form(
//             key: formKey,
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(height: altoCard * 0.05),
//                   buildFecha(),
//                   SizedBox(height: altoCard * 0.1),
//                   botonNuevoPlateo(),
//                 ])));
//   }

//   Widget buildFecha() {
//     callback(DateTime f) {
//       setState(() {
//         fecha = f;
//       });
//     }

//     return Column(children: <Widget>[
//       Row(
//         children: <Widget>[
//           Expanded(
//               child: FechaWidget(
//             fecha: fecha,
//             callback: callback,
//           )),
//         ],
//       )
//     ]);
//   }

//   Widget botonNuevoPlateo() {
//     return MainButton(
//         text: 'Comenzar plateo',
//         press: () {
//           _submit();
//         });
//   }

//   void _submit() {
//     BlocProvider.of<PlateosCubit>(context)
//         .comenzarNuevoPlateo(widget.nombrelote, fecha);
//     recargarLote(context);
//   }
// }
import 'package:apppalma/presentation/components/widgets/iniciar_nuevo_proceso_alert.dart';
import 'package:apppalma/presentation/modules/Plateos/cubit/plateos_cubit.dart';
import 'package:apppalma/utils/recargar_lote_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NuevaPlateoPage extends StatefulWidget {
  final String nombrelote;
  const NuevaPlateoPage({Key? key, required this.nombrelote}) : super(key: key);
  @override
  State<NuevaPlateoPage> createState() => _NuevaPlateoPageState();
}

class _NuevaPlateoPageState extends State<NuevaPlateoPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TimeOfDay horaSalida = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            const Text(
              "¿Este lote no se está plateando, desea iniciar un nuevo plateo?",
              style: TextStyle(fontSize: 15),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final res = await iniciarNuevoProcesoAlert(context);
                    if (res != null) {
                      _submit(res);
                    } else {
                      print(res);
                    }
                  },
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text(
                    "Comenzar nueva plateo",
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _submit(DateTime fecha) {
    BlocProvider.of<PlateosCubit>(context)
        .comenzarNuevoPlateo(widget.nombrelote, fecha);
    //Recargar lista de lotes
    recargarLote(context);
  }
}

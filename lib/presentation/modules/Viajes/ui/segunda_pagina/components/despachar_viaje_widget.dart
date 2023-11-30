import 'package:apppalma/presentation/components/secondary_button.dart';
import 'package:apppalma/presentation/modules/Viajes/cubit/viaje_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';

class DespacharViajeWidget extends StatefulWidget {
  const DespacharViajeWidget({Key? key}) : super(key: key);

  @override
  State<DespacharViajeWidget> createState() => _DespacharViajeWidgetState();
}

class _DespacharViajeWidgetState extends State<DespacharViajeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViajeCubit, ViajeInitial>(
      listener: (context, state) {
        // final aux = state.cosechasDelViaje;
      },
      builder: (context, state) {
        if (state.cosechasDelViaje.isEmpty) {
          return const Text(
            'Debe seleccionar por lo menos una cosecha',
            style: TextStyle(color: kLightGreyColor),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: buildDespacharViajeBoton(),
          );
        }
      },
    );
  }

  Widget buildDespacharViajeBoton() {
    return SecondaryButton(
        text: 'Continuar',
        press: () {
          Navigator.pushNamed(context, '/viajes/datosviaje');
        });
    // return Container(
    //     margin: EdgeInsets.all(10),
    //     height: altoCard * 0.2,
    //     width: anchoCard * 0.9,
    //     child: ElevatedButton(
    //         child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: const [
    //               Text(
    //                 'continuar',
    //                 style: TextStyle(color: Colors.black, fontSize: 20),
    //               ),
    //               Icon(Icons.chevron_right)
    //             ]),
    //         // color: Colors.lime,
    //         // shape: StadiumBorder(),
    //         onPressed: () {
    //           Navigator.pushNamed(context, 'viajes/datosviaje');
    //         }));
  }
}

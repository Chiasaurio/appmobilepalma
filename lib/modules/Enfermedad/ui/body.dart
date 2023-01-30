import 'package:apppalma/modules/Enfermedad/ui/components/enfermedad_form.dart';
import 'package:apppalma/modules/Erradicaciones/ui/ErradicacionPage/components/orientacion_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:apppalma/utils/utils.dart' as utils;

import 'components/palma_form.dart';

class Body extends StatefulWidget {
  final String nombreLote;
  const Body({Key? key, required this.nombreLote}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  int? lineaPalma;
  int? numeroPalma;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              children: [
                PalmaDataForm(
                    formKey: _formKey,
                    validators: (String? value) {
                      if (utils.isNumeric(value!)) {
                        return null;
                      } else {
                        return 'Ingrese la linea de la palma';
                      }
                    },
                    setState: () {
                      setState(() {});
                    }),
                enfermedadFormEnabled()
                    ? EnfermedadDataForm(setState: () {
                        setState(() {});
                      })
                    : const SizedBox(),
                // registrarErradicacion()

                // SubmitEnfermedadButton(
                //   enabled: registrarEnfermedadEnabled(),
                // )
              ],
            )),
      ),
    );
  }

  bool enfermedadFormEnabled() {
    if (_formKey.currentState?.validate() ?? false) {
      return true;
    }
    return false;
  }

  // Widget registrarErradicacion() {
  //   return Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
  //       child: SizedBox(
  //           width: double.infinity,
  //           height: 45,
  //           child: TextButton(
  //             style: TextButton.styleFrom(
  //                 backgroundColor: AppPalmaColors.blue,
  //                 disabledBackgroundColor: AppPalmaColors.grey,
  //                 minimumSize: const Size(88, 36),
  //                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //                 shape: const RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.all(Radius.circular(24.0)),
  //                 )),
  //             onPressed: registrarEnfermedadEnabled()
  //                 ? () {
  //                     // BlocProvider.of<ErradicacionCubit>(context)
  //                     //     .erradicarPalma();
  //                   }
  //                 : null,
  //             child: const Text('Registrar enfermedad',
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.normal,
  //                     fontSize: 16.0,
  //                     color: Colors.white)),
  //           )));
  // }

  // BlocBuilder<ErradicacionCubit, ErradicacionState> validateButton() {
  //   return BlocBuilder<ErradicacionCubit, ErradicacionState>(
  //     builder: (context, state) {
  //       if (state is ValidandoPalma) {
  //         return Container(
  //           margin: const EdgeInsets.only(top: 20),
  //           height: 25,
  //           width: 25,
  //           child: const CircularProgressIndicator(),
  //         );
  //       } else {
  //         return Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 16.0),
  //           child: ElevatedButton(
  //             onPressed: () {
  //               if (_formKey.currentState!.validate()) {
  //                 BlocProvider.of<ErradicacionCubit>(context).validarPalma(
  //                     widget.nombreLote, lineaPalma!, numeroPalma!);
  //               }
  //             },
  //             child: const Text('Validar'),
  //           ),
  //         );
  //       }
  //     },
  //   );
}

// BlocBuilder<ErradicacionCubit, ErradicacionState> causaErradicacion() {
//   return BlocBuilder<ErradicacionCubit, ErradicacionState>(
//     builder: (context, state) {
//       if (state.tieneCausa != null) {
//         if (state.tieneCausa!) {
//           return ErradicacionConCausaWidget(
//             palma: state.palma!,
//           );
//         } else {
//           return ErradicacionSinCausaWidget(
//             palma: state.palma,
//           );
//         }
//       }
//       return const SizedBox();
//     },
//   );
// }
// }

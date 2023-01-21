import 'package:apppalma/components/main_button.dart';
import 'package:apppalma/modules/Viajes/ui/peso_extractora/components/registrar_peso_dialog.dart';
import 'package:apppalma/modules/Viajes/ui/peso_extractora/cubit/peso_extractora_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrarPesoExtractoraButton extends StatefulWidget {
  const RegistrarPesoExtractoraButton({Key? key}) : super(key: key);

  @override
  State<RegistrarPesoExtractoraButton> createState() =>
      _RegistrarPesoExtractoraButtonState();
}

class _RegistrarPesoExtractoraButtonState
    extends State<RegistrarPesoExtractoraButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PesoExtractoraCubit, PesoExtractoraState>(
      builder: (context, state) {
        if (state.pesoExtractora > 0) {
          return MainButton(
            press: () {
              registrarPesoDialog(context);
            },
            text: 'Registrar peso',
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

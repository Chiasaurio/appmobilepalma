import 'package:apppalma/presentation/components/main_button.dart';
import 'package:apppalma/presentation/modules/Viajes/cubit/viaje_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'finalizar_viaje_dialog.dart';

class FinalizarViajeButton extends StatefulWidget {
  const FinalizarViajeButton({Key? key}) : super(key: key);

  @override
  State<FinalizarViajeButton> createState() => _FinalizarViajeButtonState();
}

class _FinalizarViajeButtonState extends State<FinalizarViajeButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViajeCubit, ViajeInitial>(
      builder: (context, state) {
        if (state.horaCarga != null && state.horaSalida != null) {
          return MainButton(
            press: () {
              showFinalizarViajeDialog(context);
            },
            text: 'Finalizar viaje',
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

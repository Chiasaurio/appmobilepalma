import 'package:apppalma/utils/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../components/theme.dart';
import '../../cubit/enfermedad_cubit.dart';

class SubmitEnfermedadButton extends StatelessWidget {
  final bool enabled;
  const SubmitEnfermedadButton({super.key, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnfermedadCubit, EnfermedadState>(
      builder: (context, state) {
        if (state.status != FormStatus.submissionInProgress) {
          return SizedBox(
              width: double.infinity,
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: AppPalmaColors.blue,
                    foregroundColor: AppPalmaColors.blue,
                    disabledBackgroundColor: AppPalmaColors.grey,
                    minimumSize: const Size(88, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    )),
                onPressed: enabled
                    ? () {
                        DateTime fechasalida;
                        TimeOfDay horaSalida = TimeOfDay.now();
                        fechasalida = DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                            horaSalida.hour,
                            horaSalida.minute);

                        BlocProvider.of<EnfermedadCubit>(context)
                            .insertarPalmaConEnfermedad(fechasalida);
                      }
                    : null,
                child: Text("Registrar enfermedad",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: enabled ? Colors.white : Colors.grey,
                    )),
              ));
        }
        return const Center(
          child: SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

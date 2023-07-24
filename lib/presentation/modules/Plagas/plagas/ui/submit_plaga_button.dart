import 'package:apppalma/utils/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants.dart';
import '../../cubit/plagas_cubit.dart';

class SubmitPlagaButton extends StatelessWidget {
  final bool Function()? enabled;
  const SubmitPlagaButton({super.key, this.enabled});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlagasCubit, PlagasState>(
      builder: (context, state) {
        if (state.status != FormStatus.submissionInProgress) {
          return SizedBox(
              width: double.infinity,
              height: 45,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [kpurpleColor, kblueColor])),
                child: TextButton(
                  style: TextButton.styleFrom(
                      disabledBackgroundColor:
                          kDefualtBlueColor.withOpacity(0.3),
                      minimumSize: const Size(88, 36),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      )),
                  onPressed: () {
                    if (enabled!()) {
                      DateTime fechasalida;
                      TimeOfDay horaSalida = TimeOfDay.now();
                      fechasalida = DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          horaSalida.hour,
                          horaSalida.minute);

                      BlocProvider.of<PlagasCubit>(context)
                          .insertarCenso(fechasalida);
                    }
                  },
                  child: const Text("Registrar plaga",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18.0,
                        color: Colors.white,
                      )),
                ),
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

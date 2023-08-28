import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/presentation/modules/Erradicaciones/cubit/erradicacion_cubit.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitErradicacionButton extends StatelessWidget {
  const SubmitErradicacionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ErradicacionCubit, ErradicacionConCausa>(
      builder: (context, state) {
        if (state.status != FormStatus.submissionInProgress) {
          return Container(
              margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
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
                    BlocProvider.of<ErradicacionCubit>(context)
                        .erradicarPalma();
                  },
                  child: const Text("Registrar erradicación",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                          color: Colors.white)),
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

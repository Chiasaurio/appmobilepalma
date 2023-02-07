import 'package:apppalma/constants.dart';
import 'package:apppalma/modules/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitErradicacionButton extends StatelessWidget {
  final bool enabled;
  const SubmitErradicacionButton({super.key, this.enabled = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PalmaCubit, PalmaState>(
      builder: (context, state) {
        if (state.status != FormStatus.submissionInProgress) {
          return SizedBox(
              width: double.infinity,
              height: 45,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: enabled
                            ? [kpurpleColor, kblueColor]
                            : [
                                kpurpleColor.withOpacity(0.3),
                                kblueColor.withOpacity(0.3)
                              ])),
                child: TextButton(
                  style: TextButton.styleFrom(
                      disabledBackgroundColor:
                          kDefualtBlueColor.withOpacity(0.3),
                      minimumSize: const Size(88, 36),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      )),
                  onPressed: enabled
                      ? () {
                          BlocProvider.of<PalmaCubit>(context).erradicarPalma();
                        }
                      : null,
                  child: Text("Registrar erradicación",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                        color: enabled
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
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

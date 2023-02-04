import 'package:apppalma/utils/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../components/theme.dart';
import '../../../cubit/erradicacion_cubit.dart';

class SubmitErradicacionButton extends StatelessWidget {
  final bool enabled;
  const SubmitErradicacionButton({super.key, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ErradicacionCubit, ErradicacionState>(
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
                        BlocProvider.of<ErradicacionCubit>(context)
                            .erradicarPalma();
                      }
                    : null,
                child: Text("Registrar erradicación",
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

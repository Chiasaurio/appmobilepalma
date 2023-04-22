import 'package:apppalma/SyncToServer/cubit/sync_to_server_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/constants.dart';
import '../../utils/form_status.dart';

class SubirALaNubeButton extends StatelessWidget {
  const SubirALaNubeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncToServerCubit, SyncToServerState>(
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
                    BlocProvider.of<SyncToServerCubit>(context).syncRegistros();
                  },
                  child: const Text("Subir a la nube",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
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

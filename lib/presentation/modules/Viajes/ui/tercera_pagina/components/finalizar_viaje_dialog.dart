import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../components/main_button.dart';
import '../../../cubit/viaje_cubit.dart';
import '../../primera_pagina/cubit/viajes_pendientes_cubit.dart';

showFinalizarViajeDialog(
  BuildContext context,
) {
  showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BlocConsumer<ViajeCubit, ViajeInitial>(
          listener: (context, state) {
            if (state.status == FormStatus.submissionSuccess) {
              BlocProvider.of<ViajesPendientesCubit>(context)
                  .getViajesPendientes();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            } else if (state.status == FormStatus.submissionFailure) {
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            List<Widget> textWidgets = state.cosechasDelViaje
                .map(
                  (element) => Text(element.nombreLote),
                )
                .toList();
            final localizations = MaterialLocalizations.of(context);
            final horaCarga = localizations.formatTimeOfDay(state.horaCarga!);
            final horaSalida = localizations.formatTimeOfDay(state.horaSalida!);
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              contentPadding:
                  const EdgeInsets.only(top: 50.0, bottom: 20, left: 20),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Por favor revise los datos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: textWidgets),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Total racimos: ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: '${state.totalKilos}',
                            style: const TextStyle(color: kRedColor)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Total kilos: ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: '${state.totalRacimos}',
                            style: const TextStyle(color: kRedColor)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Hora de carga: ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: horaCarga,
                            style: const TextStyle(color: kRedColor)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Hora de salida: ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: horaSalida,
                            style: const TextStyle(color: kRedColor)),
                      ],
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: MainButton(
                        text: 'Finalizar',
                        press: () {
                          BlocProvider.of<ViajeCubit>(context).finalizarViaje();
                        },
                      )),
                    ],
                  ),
                )
              ],
            );
          },
        );
      });
}

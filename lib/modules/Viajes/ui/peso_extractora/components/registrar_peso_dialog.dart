import 'package:apppalma/constants.dart';
import 'package:apppalma/modules/Viajes/ui/peso_extractora/cubit/peso_extractora_cubit.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../components/main_button.dart';
import '../../../cubit/viaje_cubit.dart';
import '../../primera_pagina/cubit/viajes_pendientes_cubit.dart';

registrarPesoDialog(
  BuildContext context,
) {
  showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BlocConsumer<PesoExtractoraCubit, PesoExtractoraState>(
          listener: (context, state) {
            if (state.status == FormStatus.submissionSuccess) {
              BlocProvider.of<ViajesPendientesCubit>(context)
                  .getViajesPendientes();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            } else if (state.status == FormStatus.submissionFailure) {
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              contentPadding: const EdgeInsets.only(top: 50.0, bottom: 20),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Por favor revise los datos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // ConstrainedBox(
                        //   constraints: const BoxConstraints(minWidth: 80),
                        //   // height: 150,
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 20.0, vertical: 10),
                        //     child: ListView.builder(
                        //       shrinkWrap: true,
                        //       itemCount: state.cosechasDelViaje.length,
                        //       itemBuilder: (context, index) {
                        //         return Center(
                        //           child: Text(
                        //               state.cosechasDelViaje[index].nombreLote),
                        //         );
                        //       },
                        //     ),
                        //   ),
                        // ),
                        RichText(
                          text: TextSpan(
                            text: 'Peso finca: ',
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${state.viaje!.kilos}',
                                  style: const TextStyle(color: kRedColor)),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Peso extractora: ',
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${state.pesoExtractora}',
                                  style: const TextStyle(color: kRedColor)),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
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
                          BlocProvider.of<PesoExtractoraCubit>(context)
                              .confirmarPesoExtractora();
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

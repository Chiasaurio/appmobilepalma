import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/presentation/modules/Sync/cubit/bajar_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardUltimaSync extends StatefulWidget {
  const CardUltimaSync({Key? key}) : super(key: key);

  @override
  State<CardUltimaSync> createState() => _CardUltimaSyncsState();
}

class _CardUltimaSyncsState extends State<CardUltimaSync> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BajarInfoCubit, BajarInfoState>(
      listener: (context, state) {
        setState(() {});
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Column(children: [
            TextSyncPendiente(
              fechaUltimaActualizacion: state.loteFechaUltimaActualizacion,
              type: Lote,
            ),
            TextSyncPendiente(
              fechaUltimaActualizacion:
                  state.enfermedadFechaUltimaActualizacion,
              type: Enfermedade,
            ),
            TextSyncPendiente(
              fechaUltimaActualizacion: state.plagaFechaUltimaActualizacion,
              type: Plaga,
            ),
            TextSyncPendiente(
              fechaUltimaActualizacion:
                  state.agroquimicoFechaUltimaActualizacion,
              type: ProductoAgroquimicoData,
            ),
            TextSyncPendiente(
              fechaUltimaActualizacion:
                  state.fertilizanteFechaUltimaActualizacion,
              type: FertilizanteData,
            ),
          ]),
        );
      },
    );
  }
}

class TextSyncPendiente extends StatelessWidget {
  final Type type;
  const TextSyncPendiente({
    Key? key,
    required this.fechaUltimaActualizacion,
    required this.type,
  }) : super(key: key);

  final String? fechaUltimaActualizacion;

  @override
  Widget build(BuildContext context) {
    String text = '';
    SyncStatus status = SyncStatus.initial;
    return BlocBuilder<BajarInfoCubit, BajarInfoState>(
      builder: (context, state) {
        switch (type) {
          case Lote:
            text = 'Lotes';
            status = state.estadoLote;
            break;
          case Enfermedade:
            text = 'Enfermedades';
            status = state.estadoEnfermedad;
            break;
          case Plaga:
            text = 'Plagas';
            status = state.estadoPlaga;
            break;
          case ProductoAgroquimicoData:
            text = 'Productos agroquimicos';
            status = state.estadoAgroquimico;
            break;
          case FertilizanteData:
            text = 'Fertilizantes';
            status = state.estadoFertilizante;
            break;
          default:
        }

        late Widget icon;
        if (status == SyncStatus.loading) {
          icon = const SizedBox(
              height: 15,
              width: 15,
              child: Center(
                  child: CircularProgressIndicator(
                color: kpurpleColor,
              )));
        } else if (status == SyncStatus.success) {
          icon = const Icon(
            Icons.check,
            color: Colors.green,
          );
        } else if (status == SyncStatus.error) {
          icon = const Icon(
            Icons.warning_amber,
            color: Colors.red,
          );
        } else {
          icon = const Icon(
            FontAwesomeIcons.accusoft,
            color: Colors.transparent,
          );
        }

        return Column(
          children: [
            Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(text, style: const TextStyle(fontSize: 16)),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle),
                          child: icon,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 239, 239, 239),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Fecha ultima actualización: ',
                            style: TextStyle(
                              fontSize: 12,
                            )),
                        if (fechaUltimaActualizacion != null &&
                            fechaUltimaActualizacion != "")
                          Flexible(
                            child: Text(fechaUltimaActualizacion!,
                                style: const TextStyle(
                                  fontSize: 12,
                                )),
                          ),
                        if (fechaUltimaActualizacion == null ||
                            fechaUltimaActualizacion == "")
                          const Flexible(
                            child: Text('Nunca',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.red)),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   decoration: const BoxDecoration(
            //       color: Color.fromARGB(255, 239, 239, 239),
            //       borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(20),
            //           bottomRight: Radius.circular(20))),
            //   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Text('Fecha ultima actualización: ',
            //           style: TextStyle(
            //             fontSize: 12,
            //           )),
            //       Flexible(
            //         child: Text(fechaUltimaActualizacion ?? '',
            //             style: const TextStyle(
            //               fontSize: 12,
            //             )),
            //       ),
            //     ],
            //   ),
            // )
          ],
        );
      },
    );
  }
}

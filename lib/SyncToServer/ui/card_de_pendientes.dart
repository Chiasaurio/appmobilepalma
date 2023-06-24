import 'package:apppalma/SyncToServer/cubit/sync_to_server_cubit.dart';
import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/moor/tables/tables.dart';

class CardPendientes extends StatefulWidget {
  const CardPendientes({Key? key}) : super(key: key);

  @override
  State<CardPendientes> createState() => _CardPendientesState();
}

class _CardPendientesState extends State<CardPendientes> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SyncToServerCubit, SyncToServerState>(
      listener: (context, state) {
        setState(() {});
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(children: [
            TextSyncPendiente(
              list: state.palmasPendientes!,
              type: Palma,
            ),
            TextSyncPendiente(
              list: state.enfermedadesPendientes!,
              type: RegistroEnfermedadData,
            ),
            TextSyncPendiente(
              list: state.tratamientosPendientes!,
              type: RegistroTratamientoData,
            ),
            TextSyncPendiente(
              list: state.censosPendientes!,
              type: CensoData,
            ),
            TextSyncPendiente(
              list: state.fumigacionesPendientes!,
              type: Aplicacione,
            ),
            TextSyncPendiente(
              list: state.cosechasConDiariasPendientes!,
              type: CosechaConCosechasDiarias,
            ),
            TextSyncPendiente(
              list: state.podasConDiariasPendientes!,
              type: PodasConPodasDiarias,
            ),
            TextSyncPendiente(
              list: state.plateosConDiariasPendientes!,
              type: PlateoConPlateosDiarias,
            ),
            TextSyncPendiente(
              list: state.viajesPendientes!,
              type: Viaje,
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
    required this.list,
    required this.type,
  }) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    String text = '';
    SyncStatus status = SyncStatus.initial;
    return BlocBuilder<SyncToServerCubit, SyncToServerState>(
      builder: (context, state) {
        switch (type) {
          case CosechaConCosechasDiarias:
            text = 'cosechas pendientes';
            status = state.cosechasStatus;
            break;
          case PodasConPodasDiarias:
            text = 'podas pendientes';
            status = state.podasStatus;
            break;
          case PlateoConPlateosDiarias:
            text = 'plateos pendientes';
            status = state.plateosStatus;
            break;
          case Palma:
            text = 'palmas pendientes';
            status = state.palmasStatus;
            break;
          case RegistroEnfermedadData:
            text = 'enfermedades pendientes';
            status = state.enfermedadesStatus;
            break;
          case RegistroTratamientoData:
            text = 'tratamientos pendientes';
            status = state.tratamientosStatus;
            break;
          case CensoData:
            text = 'censos pendientes';
            status = state.censosStatus;
            break;
          case Aplicacione:
            text = 'aplicaciones pendientes';
            status = state.fumigacionesStatus;
            break;
          case Viaje:
            text = 'viajes pendientes';
            status = state.viajesStatus;
            break;

          default:
        }

        Widget icon = status == SyncStatus.loading
            ? const SizedBox(
                height: 15,
                width: 15,
                child: Center(
                    child: CircularProgressIndicator(
                  color: kpurpleColor,
                )))
            : status == SyncStatus.success
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.warning_amber,
                    color: Colors.red,
                  );
        if (list.isNotEmpty) {
          return Card(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${list.length} registros de $text"),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                        color: Colors.transparent, shape: BoxShape.circle),
                    child: icon,
                  )
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

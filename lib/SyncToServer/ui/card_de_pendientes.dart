import 'package:apppalma/SyncToServer/cubit/sync_to_server_cubit.dart';
import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/moor/tables/tables.dart';

class CardPendientes extends StatefulWidget {
  const CardPendientes({super.key});

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
              list: state.fertilizacionesConDiariasPendientes!,
              type: FertilizacionConFertilizacionesDiarias,
            ),
            TextSyncPendiente(
              list: state.viajesPendientes!,
              type: Viaje,
            ),
            TextSyncPendiente(
              list: state.precipitacionesPendientes!,
              type: PrecipitacionData,
            ),
            TextSyncPendiente(
              list: state.censosProductivosPendientes!,
              type: CensoProductivoData,
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
    super.key,
    required this.list,
    required this.type,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    String text = '';
    SyncStatus status = SyncStatus.initial;
    return BlocBuilder<SyncToServerCubit, SyncToServerState>(
      builder: (context, state) {
        switch (type) {
          case CosechaConCosechasDiarias _:
            text = 'cosechas pendientes';
            status = state.cosechasStatus;
            break;
          case PodasConPodasDiarias _:
            text = 'podas pendientes';
            status = state.podasStatus;
            break;
          case PlateoConPlateosDiarias _:
            text = 'plateos pendientes';
            status = state.plateosStatus;
            break;
          case FertilizacionConFertilizacionesDiarias _:
            text = 'fertilizaciones pendientes';
            status = state.fertilizacionesStatus;
            break;
          case Palma _:
            text = 'palmas pendientes';
            status = state.palmasStatus;
            break;
          case RegistroEnfermedadData _:
            text = 'enfermedades pendientes';
            status = state.enfermedadesStatus;
            break;
          case RegistroTratamientoData _:
            text = 'tratamientos pendientes';
            status = state.tratamientosStatus;
            break;
          case CensoData _:
            text = 'censos pendientes';
            status = state.censosStatus;
            break;
          case Aplicacione _:
            text = 'aplicaciones pendientes';
            status = state.fumigacionesStatus;
            break;
          case Viaje _:
            text = 'viajes pendientes';
            status = state.viajesStatus;
            break;
          case PrecipitacionData _:
            text = 'precipitacion pendientes';
            status = state.precipitacionesStatus;
            break;
          case CensoProductivoData _:
            text = 'censos productivo pendientes';
            status = state.censosProductivosStatus;
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
                  Flexible(child: Text("${list.length} registros de $text")),
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

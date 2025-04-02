import 'package:apppalma/presentation/modules/SyncToServer/cubit/sync_to_server_cubit.dart';
import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/moor/tables/tables.dart';

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
        if (type == CosechaConCosechasDiarias) {
          text = 'cosechas pendientes';
          status = state.cosechasStatus;
        } else if (type == PodasConPodasDiarias) {
          text = 'podas pendientes';
          status = state.podasStatus;
        } else if (type == PlateoConPlateosDiarias) {
          text = 'plateos pendientes';
          status = state.plateosStatus;
        } else if (type == FertilizacionConFertilizacionesDiarias) {
          text = 'fertilizaciones pendientes';
          status = state.fertilizacionesStatus;
        } else if (type == Palma) {
          text = 'palmas pendientes';
          status = state.palmasStatus;
        } else if (type == RegistroEnfermedadData) {
          text = 'enfermedades pendientes';
          status = state.enfermedadesStatus;
        } else if (type == RegistroTratamientoData) {
          text = 'tratamientos pendientes';
          status = state.tratamientosStatus;
        } else if (type == CensoData) {
          text = 'censos pendientes';
          status = state.censosStatus;
        } else if (type == Aplicacione) {
          text = 'aplicaciones pendientes';
          status = state.fumigacionesStatus;
        } else if (type == Viaje) {
          text = 'viajes pendientes';
          status = state.viajesStatus;
        } else if (type == PrecipitacionData) {
          text = 'precipitacion pendientes';
          status = state.precipitacionesStatus;
        } else if (type == CensoProductivoData) {
          text = 'censos productivo pendientes';
          status = state.censosProductivosStatus;
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

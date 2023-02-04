import 'package:apppalma/SyncToServer/cubit/sync_to_server_cubit.dart';
import 'package:apppalma/moor/tables/cosechas_table.dart';
import 'package:apppalma/moor/tables/podas_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../moor/tables/plateos_table.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(children: [
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
            )
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
    switch (type) {
      case CosechaConCosechasDiarias:
        text = 'cosechas pendientes';
        break;
      case PodasConPodasDiarias:
        text = 'podas pendientes';
        break;
      case PlateoConPlateosDiarias:
        text = 'plateos pendientes';
        break;
      default:
    }
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
                  child: const Icon(
                    Icons.warning_amber,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}

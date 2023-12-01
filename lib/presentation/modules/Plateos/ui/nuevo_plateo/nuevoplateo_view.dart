import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/recargar_lote_detail.dart';
import '../../cubit/plateos_cubit.dart';

import '../models/nuevo_plateo_alert_response_model.dart';
import 'iniciar_nuevo_proceso_alert.dart';

class NuevaPlateoPage extends StatefulWidget {
  final String nombrelote;
  const NuevaPlateoPage({Key? key, required this.nombrelote}) : super(key: key);
  @override
  State<NuevaPlateoPage> createState() => _NuevaPlateoPageState();
}

class _NuevaPlateoPageState extends State<NuevaPlateoPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TimeOfDay horaSalida = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            const Text(
              "¿Este lote no se está plateando, desea iniciar un nuevo plateo?",
              style: TextStyle(fontSize: 15),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final NuevoPlateoModel? res =
                        await iniciarNuevoProcesoAlert(context);
                    if (res != null) {
                      _submit(res.fecha, res.tipo);
                    }
                  },
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text(
                    "Comenzar nuevo plateo",
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _submit(DateTime fecha, String tipoPlateo) {
    BlocProvider.of<PlateosCubit>(context)
        .comenzarNuevoPlateo(widget.nombrelote, fecha, tipoPlateo);
    //Recargar lista de lotes
    recargarLote(context);
  }
}

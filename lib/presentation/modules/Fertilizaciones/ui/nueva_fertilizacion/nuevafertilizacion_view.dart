import 'package:apppalma/presentation/components/widgets/iniciar_nuevo_proceso_alert.dart';
import 'package:apppalma/presentation/modules/Fertilizaciones/cubit/fertilizaciones_cubit.dart';
import 'package:apppalma/utils/recargar_lote_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NuevaFertilizacionPage extends StatefulWidget {
  final String nombrelote;
  const NuevaFertilizacionPage({Key? key, required this.nombrelote})
      : super(key: key);
  @override
  State<NuevaFertilizacionPage> createState() => _NuevaFertilizacionPageState();
}

class _NuevaFertilizacionPageState extends State<NuevaFertilizacionPage> {
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
              "¿Este lote no se está fertilizando, desea iniciar una nueva fertilizacion?",
              style: TextStyle(fontSize: 15),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final res = await iniciarNuevoProcesoAlert(context);
                    if (res != null) {
                      _submit(res);
                    } else {
                      print(res);
                    }
                  },
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text(
                    "Comenzar nueva fertilizacion",
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _submit(DateTime fecha) {
    BlocProvider.of<FertilizacionCubit>(context)
        .comenzarNuevaFertilizacion(widget.nombrelote, fecha);
    //Recargar lista de lotes
    recargarLote(context);
  }
}

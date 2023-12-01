import 'package:apppalma/presentation/components/widgets/iniciar_nuevo_proceso_alert.dart';
import 'package:apppalma/presentation/modules/Cosechas/cubit/cosecha_cubit.dart';
import 'package:apppalma/utils/recargar_lote_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NuevaCosechaPage extends StatefulWidget {
  final String nombrelote;
  const NuevaCosechaPage({Key? key, required this.nombrelote})
      : super(key: key);
  @override
  State<NuevaCosechaPage> createState() => _NuevaCosechaPageState();
}

class _NuevaCosechaPageState extends State<NuevaCosechaPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TimeOfDay horaSalida = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
  }

  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late double margin;

  @override
  Widget build(BuildContext context) {
    // return buildNuevaCosechaForm();
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
              "¿Este lote no se está cosechando, desea iniciar una nueva cosecha?",
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
                    }
                  },
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text(
                    "Comenzar nueva cosecha",
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
    BlocProvider.of<CosechaCubit>(context)
        .comenzarNuevaCosecha(widget.nombrelote, fecha);
    //Recargar lista de lotes
    recargarLote(context);
  }
}

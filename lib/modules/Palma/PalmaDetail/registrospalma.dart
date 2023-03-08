import 'package:apppalma/modules/Palma/PalmaDetail/body.dart';
import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';

import '../../../domain/palma/models/palma_con_procesos_model.dart';

class PalmaDetalleScreen extends StatefulWidget {
  final Palma palma;
  final String routeName;
  const PalmaDetalleScreen(
      {Key? key,
      required this.palma,
      this.routeName = 'lote/palmas/palmadetalle'})
      : super(key: key);

  @override
  State<PalmaDetalleScreen> createState() => _PalmaDetalleScreenState();
}

class _PalmaDetalleScreenState extends State<PalmaDetalleScreen> {
  PalmaConProcesos? palmaConProcesos;
  @override
  void initState() {
    getProcesosPalma(widget.palma);
    super.initState();
  }

  getProcesosPalma(Palma palma) async {
    // palmaConProcesos =
    //     await BlocProvider.of<PalmaCubit>(context).obtenerProcesosPalma(palma);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: palmaConProcesos != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  HeaderApp(
                    ruta: widget.routeName,
                  ),
                  Body(palmaConProcesos: palmaConProcesos!)
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

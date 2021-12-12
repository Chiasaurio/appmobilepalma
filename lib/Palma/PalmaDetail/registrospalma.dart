import 'package:apppalma/Palma/PalmaDetail/body.dart';
import 'package:apppalma/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PalmaDetalleScreen extends StatefulWidget {
  final Palma palma;
  const PalmaDetalleScreen({Key? key, required this.palma}) : super(key: key);

  @override
  _PalmaDetalleScreenState createState() => _PalmaDetalleScreenState();
}

class _PalmaDetalleScreenState extends State<PalmaDetalleScreen> {
  PalmaConProcesos? palmaConProcesos;
  @override
  void initState() {
    getProcesosPalma(widget.palma);
    super.initState();
  }

  getProcesosPalma(Palma palma) async {
    palmaConProcesos =
        await BlocProvider.of<PalmaCubit>(context).obtenerProcesosPalma(palma);
    print(palmaConProcesos);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: palmaConProcesos != null
          ? Column(
              children: [
                const HeaderApp(),
                Body(palmaConProcesos: palmaConProcesos!)
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class PalmaConProcesos {
  Palma palma;
  RegistroEnfermedadData? registroenfermedad;
  Enfermedade? enfermedad;
  Etapa? etapa;
  RegistroTratamientoData? registrotratamiento;

  PalmaConProcesos({
    required this.palma,
    required this.registroenfermedad,
    required this.registrotratamiento,
    required this.etapa,
    required this.enfermedad,
  });
}

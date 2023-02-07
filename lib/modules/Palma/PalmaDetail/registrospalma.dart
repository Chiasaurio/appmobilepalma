import 'package:apppalma/modules/Palma/PalmaDetail/body.dart';
import 'package:apppalma/components/custom_appbar.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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

class PalmaConProcesos extends Equatable {
  final Palma palma;
  final List<RegistroEnfermedadDatos> registroenfermedaddatos;

  const PalmaConProcesos({
    required this.palma,
    required this.registroenfermedaddatos,
  });
  @override
  List<Object?> get props => [palma, registroenfermedaddatos];
}

class RegistroEnfermedadDatos extends Equatable {
  final RegistroEnfermedadData registroenfermedad;
  final Enfermedade? enfermedad;
  final Etapa? etapa;
  final RegistroTratamientoData? registrotratamiento;
  final bool isExpanded;

  const RegistroEnfermedadDatos({
    required this.registroenfermedad,
    required this.etapa,
    required this.enfermedad,
    required this.registrotratamiento,
    this.isExpanded = false,
  });

  RegistroEnfermedadDatos changeExpanded({bool? expanded}) {
    return RegistroEnfermedadDatos(
        registroenfermedad: registroenfermedad,
        etapa: etapa,
        enfermedad: enfermedad,
        registrotratamiento: registrotratamiento,
        isExpanded: expanded ?? isExpanded);
  }

  @override
  List<Object?> get props =>
      [registroenfermedad, etapa, enfermedad, registrotratamiento, isExpanded];
}

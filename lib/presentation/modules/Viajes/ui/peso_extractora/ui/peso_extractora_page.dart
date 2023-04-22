import 'package:apppalma/presentation/components/widgets/header_gradient.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/presentation/modules/Viajes/ui/peso_extractora/components/registar_peso_extractora_button.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class PesoExtractoraPage extends StatefulWidget {
  final String routeName;
  final Viaje viaje;
  const PesoExtractoraPage(
      {Key? key, required this.routeName, required this.viaje})
      : super(key: key);

  @override
  State<PesoExtractoraPage> createState() => _PesoExtractoraPageState();
}

class _PesoExtractoraPageState extends State<PesoExtractoraPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderGradient(
              title: "Registrar peso extractora", ruta: widget.routeName),
          const Body(),
        ],
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.all(8.0),
        child: RegistrarPesoExtractoraButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

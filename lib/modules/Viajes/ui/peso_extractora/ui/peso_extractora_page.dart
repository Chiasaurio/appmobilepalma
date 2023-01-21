import 'package:apppalma/constants.dart';
import 'package:apppalma/modules/Viajes/ui/peso_extractora/components/registar_peso_extractora_button.dart';
import 'package:flutter/material.dart';

import '../../../../../components/theme.dart';
import '../../../../../moor/moor_database.dart';
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
      appBar: AppBar(
        backgroundColor: AppPalmaColors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.routeName,
              style: const TextStyle(fontSize: 14),
            ),
            const Text(
              nombreFinca,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: const Body(),
      floatingActionButton: const Padding(
        padding: EdgeInsets.all(8.0),
        child: RegistrarPesoExtractoraButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

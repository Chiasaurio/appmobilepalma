import 'package:flutter/material.dart';

import '../components/finalizar_viaje_button.dart';
import 'body.dart';

class DatosViajesPage extends StatefulWidget {
  final String routeName;

  const DatosViajesPage({Key? key, required this.routeName}) : super(key: key);

  @override
  State<DatosViajesPage> createState() => _DatosViajesPageState();
}

class _DatosViajesPageState extends State<DatosViajesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppPalmaColors.blue,
      //   title: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         widget.routeName,
      //         style: const TextStyle(fontSize: 14),
      //       ),
      //       const Text(
      //         nombreFinca,
      //         style: TextStyle(fontSize: 14),
      //       ),
      //     ],
      //   ),
      // ),
      body: Body(
        routeName: widget.routeName,
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FinalizarViajeButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

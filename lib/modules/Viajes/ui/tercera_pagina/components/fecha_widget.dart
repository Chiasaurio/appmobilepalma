import 'package:flutter/material.dart';

import '../../../../../../components/widgets/fecha.dart';

class FechaViajeWidget extends StatefulWidget {
  const FechaViajeWidget({Key? key}) : super(key: key);

  @override
  State<FechaViajeWidget> createState() => _FechaViajeWidgetState();
}

class _FechaViajeWidgetState extends State<FechaViajeWidget> {
  DateTime fechaviaje =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    callback(DateTime fecha) {
      setState(() {
        fechaviaje = fecha;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Fecha de salida',
            style: TextStyle(color: Colors.black, fontSize: 16)),
        const SizedBox(
          height: 15,
        ),
        FechaWidget(fecha: fechaviaje, callback: callback),
      ],
    );
  }
}

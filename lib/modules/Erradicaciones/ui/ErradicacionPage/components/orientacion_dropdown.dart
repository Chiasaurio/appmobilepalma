import 'package:flutter/material.dart';

class OrientacionPalmaDropwdown extends StatefulWidget {
  const OrientacionPalmaDropwdown({Key? key}) : super(key: key);

  @override
  State<OrientacionPalmaDropwdown> createState() =>
      _OrientacionPalmaDropwdownState();
}

class _OrientacionPalmaDropwdownState extends State<OrientacionPalmaDropwdown> {
  List<String> orientaciones = ['NORTE-SUR', 'SUR-NORTE', 'ORIENTE-OCCIDENTE'];
  String? orientacion;
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> getOpcionesDropdown() {
      List<DropdownMenuItem<String>> lista = [];
      for (var c in orientaciones) {
        lista.add(DropdownMenuItem(
          value: c,
          child: Text(c),
        ));
      }
      return lista;
    }

    return Row(children: <Widget>[
      // Icon(Icons.select_all),
      Expanded(
          child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          label: Text(
            "Orientación",
            style: TextStyle(fontSize: 15),
          ),
          contentPadding: EdgeInsets.only(left: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
          ),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          // ),
        ),
        elevation: 5,
        isExpanded: true,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        value: orientacion,
        items: getOpcionesDropdown(),
        onChanged: (opt) {
          setState(() {
            if (opt != null) {
              orientacion = opt;
            }
          });
        },
        validator: (value) => value == null ? 'Este campo es requerido' : null,
      ))
    ]);
  }
}

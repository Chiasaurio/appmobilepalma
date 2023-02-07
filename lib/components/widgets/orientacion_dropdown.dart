import 'package:flutter/material.dart';

class OrientacionPalmaDropwdown extends StatefulWidget {
  final Function() setState;
  const OrientacionPalmaDropwdown({Key? key, required this.setState})
      : super(key: key);

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
          child: Text(
            c,
            style: const TextStyle(fontSize: 15),
          ),
        ));
      }
      return lista;
    }

    return Row(children: <Widget>[
      Expanded(
          child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          label: Text(
            "Orientación",
            style: TextStyle(fontSize: 15),
          ),
          contentPadding: EdgeInsets.only(left: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
          ),
        ),
        elevation: 5,
        isExpanded: true,
        style: const TextStyle(
          fontSize: 15,
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
          widget.setState();
          FocusScope.of(context).requestFocus(FocusNode());
        },
        validator: (value) => value == null ? 'Este campo es requerido' : null,
      ))
    ]);
  }
}

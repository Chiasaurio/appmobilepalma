import 'package:apppalma/presentation/constants.dart';
import 'package:flutter/material.dart';

class OrientacionPalmaDropwdown extends StatefulWidget {
  final Function(String) blocCall;
  final Function() setState;
  final String? initialValue;
  const OrientacionPalmaDropwdown(
      {Key? key,
      required this.setState,
      required this.blocCall,
      this.initialValue})
      : super(key: key);

  @override
  State<OrientacionPalmaDropwdown> createState() =>
      _OrientacionPalmaDropwdownState();
}

class _OrientacionPalmaDropwdownState extends State<OrientacionPalmaDropwdown> {
  String? orientacion;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      orientacion = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> getOpcionesDropdown() {
      List<DropdownMenuItem<String>> lista = [];
      for (var c in orientaciones) {
        lista.add(DropdownMenuItem(
          value: c,
          child: Text(
            c,
            style: const TextStyle(fontSize: 18),
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
            style: TextStyle(fontSize: 18),
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
              widget.blocCall(orientacion!);
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

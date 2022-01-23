import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class FechaWidget extends StatefulWidget {
  DateTime fecha;
  Function(DateTime) callback;

  FechaWidget({Key? key, required this.fecha, required this.callback})
      : super(key: key);

  @override
  _FechaWidgetState createState() => _FechaWidgetState();
}

class _FechaWidgetState extends State<FechaWidget> {
  late DateTime _fecha;
  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;

  var formatter = DateFormat('yyyy-MM-dd hh:mm');

  final TextEditingController _inputFieldDateController =
      TextEditingController();
  late DateTime fechaHoy;
  TimeOfDay horaHoy = TimeOfDay.now();

  @override
  void initState() {
    fechaHoy = widget.fecha;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _fecha = fechaHoy;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.5; //150,
    anchoCard = width;
    _inputFieldDateController.text = formatter.format(_fecha);
    return Container(
      child: _buildFecha(context),
    );
  }

  Widget _buildFecha(BuildContext context) {
    return TextFormField(
      readOnly: true,
      style: const TextStyle(fontSize: 20),
      textAlign: TextAlign.start,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.calendar_today),
        labelText: 'Fecha',
        labelStyle: TextStyle(fontSize: 18),
        // hintText: campo,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      validator: (value) => value == null ? 'Este campo es requerido' : null,
      // onTap: () {
      //   FocusScope.of(context).requestFocus(FocusNode());
      //   _selectDate(context);
      // }
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016),
        lastDate: DateTime(2025),
        locale: const Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _fecha = picked;
        widget.callback(picked);
        _inputFieldDateController.text = formatter.format(_fecha);
      });
    }
  }
}

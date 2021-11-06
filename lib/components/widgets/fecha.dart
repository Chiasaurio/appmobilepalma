import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class FechaWidget extends StatefulWidget {
  DateTime fecha;
  Function(DateTime) callback;

  FechaWidget(this.fecha, this.callback);

  @override
  _FechaWidgetState createState() => _FechaWidgetState();
}

class _FechaWidgetState extends State<FechaWidget> {
  late DateTime _fecha;
  var width;
  var height;
  var altoCard;
  var anchoCard;

  var formatter = new DateFormat('yyyy-MM-dd');

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _fecha = widget.fecha;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.5; //150,
    anchoCard = width;
    _fecha != null
        ? _inputFieldDateController.text = '${formatter.format(_fecha)}'
        : _inputFieldDateController.text;

    return Container(
      child: _buildFecha(context),
    );
  }

  Widget _buildFecha(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey[400],
      //       blurRadius: 5,
      //       offset: Offset(0, 2))
      // ]),
      child: TextFormField(
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.start,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.calendar_today),
            labelText: 'Fecha',
            labelStyle: TextStyle(fontSize: 18),
            // hintText: campo,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          enableInteractiveSelection: false,
          controller: _inputFieldDateController,
          validator: (value) =>
              value == null ? 'Este campo es requerido' : null,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            _selectDate(context);
          }),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _fecha = picked;
        widget.callback(picked);
        _inputFieldDateController.text = '${formatter.format(_fecha)}';
      });
    }
  }
}

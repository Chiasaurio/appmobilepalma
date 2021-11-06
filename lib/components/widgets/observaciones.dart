import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ObservacionWidget extends StatefulWidget {
  @override
  _ObservacionWidgetState createState() => _ObservacionWidgetState();
}

class _ObservacionWidgetState extends State<ObservacionWidget> {
  var width;
  var height;
  var altoCard;
  var anchoCard;
  String _observacion = '';

  var formatter = new DateFormat('yyyy-MM-dd');
  DateTime _fecha =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      child: _buildObservacion(),
    );
  }

  Widget _buildObservacion() {
    return TextFormField(
      // keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: 'Observaciones',
          labelText: 'Observaciones',
          helperText: 'Observaciones',
          suffixIcon: Icon(Icons.comment),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onChanged: (String value) {
        _observacion = value;
      },
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HoraWidget extends StatefulWidget {
  TimeOfDay hora;
  Function(TimeOfDay) callback;

  HoraWidget({Key? key, required this.hora, required this.callback})
      : super(key: key);

  @override
  _HoraWidgetState createState() => _HoraWidgetState();
}

class _HoraWidgetState extends State<HoraWidget> {
  late TimeOfDay _hora;
  late String _hour, _minute, _time;
  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;
  late String formattedTimeOfDay;
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _hora = widget.hora;
    final localizations = MaterialLocalizations.of(context);
    final formattedTimeOfDay = localizations.formatTimeOfDay(_hora);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.5; //150,
    anchoCard = width;
    _timeController.text = formattedTimeOfDay;
    return Container(
      child: _buildFecha(context),
    );
  }

  Widget _buildFecha(BuildContext context) {
    return TextFormField(
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.start,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.calendar_today),
          labelText: 'Hora',
          labelStyle: TextStyle(fontSize: 18),
          // hintText: campo,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        enableInteractiveSelection: false,
        controller: _timeController,
        validator: (value) => value == null ? 'Este campo es requerido' : null,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          // _selectTime(context);
        });
  }

  // _selectTime(BuildContext context) async {
  // final TimeOfDay? picked = await showTimePicker(
  //   context: context,
  //   initialTime: _hora,
  // );
  // if (picked != null)
  //   setState(() {
  //     _hora = picked;
  //     _hour = _hora.hour.toString();
  //     _minute = _hora.minute.toString();
  //     _time = _hour + ' : ' + _minute;
  //     _timeController.text = _time;
  //     _timeController.text = formatDate(
  //         DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
  //         [hh, ':', nn, " ", am]).toString();
  //   });}
}

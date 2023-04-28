import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class FechaWidget extends StatefulWidget {
  DateTime? fecha;
  Function(DateTime) callback;

  FechaWidget({Key? key, required this.fecha, required this.callback})
      : super(key: key);
  @override
  State<FechaWidget> createState() => _FechaWidgetState();
}

class _FechaWidgetState extends State<FechaWidget> {
  DateTime? _fecha;
  late double width;
  late double height;
  late double altoCard;
  late double anchoCard;

  var formatter = DateFormat('yyyy-MM-dd hh:mm');

  final TextEditingController _inputFieldDateController =
      TextEditingController();
  TimeOfDay horaHoy = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _fecha = widget.fecha;
    if (_fecha == null) {
      _inputFieldDateController.text = "";
    } else {
      _inputFieldDateController.text = formatter.format(_fecha!);
    }
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    altoCard = height * 0.5; //150,
    anchoCard = width;
    return Container(
      child: _buildFecha(context),
    );
  }

  Widget _buildFecha(BuildContext context) {
    return TextFormField(
        readOnly: true,
        style: const TextStyle(fontSize: 17),
        textAlign: TextAlign.start,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.calendar_today,
            size: 20,
          ),
          label: Text(
            "Fecha",
            style: TextStyle(fontSize: 15),
          ),
          contentPadding: EdgeInsets.only(left: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
          ),
        ),
        enableInteractiveSelection: false,
        controller: _inputFieldDateController,
        validator: (value) => value == null ? 'Este campo es requerido' : null,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          _selectDate(context);
        });
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
        _inputFieldDateController.text = formatter.format(_fecha!);
      });
    }
  }
}

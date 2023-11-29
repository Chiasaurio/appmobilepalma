import 'package:apppalma/presentation/modules/Plateos/ui/models/nuevo_plateo_alert_response_model.dart';
import 'package:apppalma/presentation/modules/Plateos/ui/nuevo_plateo/tipo_plateo_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

iniciarNuevoProcesoAlert(BuildContext context) {
  DateTime fecha = DateTime.now();
  String? tipoPlateo;
  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          callback(DateTime f) {
            setState(() {
              fecha = f;
            });
          }

          callbackPlateo(String tipo) {
            setState(() {
              tipoPlateo = tipo;
            });
          }

          return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Confirme la fecha inicio",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ConfirmDate(fecha: fecha, callback: callback),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TipoPlateo(
                    callback: callbackPlateo,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          elevation: 0,
                        ),
                        child: const Text("Cancelar"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 0,
                        ),
                        onPressed: tipoPlateo != null
                            ? () {
                                Navigator.pop(
                                    context,
                                    NuevoPlateoModel(
                                        fecha: fecha, tipo: tipoPlateo!));
                              }
                            : null,
                        child: const Text("Confirmar"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class ConfirmDate extends StatefulWidget {
  final DateTime? fecha;
  final Function(DateTime) callback;

  const ConfirmDate({Key? key, required this.fecha, required this.callback})
      : super(key: key);
  @override
  State<ConfirmDate> createState() => _ConfirmDateState();
}

class _ConfirmDateState extends State<ConfirmDate> {
  DateTime? _fecha;

  // Format the DateTime object to a string with the day of the week and month in Spanish

  // var formatter = DateFormat('yyyy-MM-dd hh:mm');
  final DateFormat formatter = DateFormat('EEEE, d MMMM y', 'es');
  final TextEditingController _inputFieldDateController =
      TextEditingController();

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
        TimeOfDay horaHoy = TimeOfDay.now();
        _fecha = DateTime(picked.year, picked.month, picked.day, horaHoy.hour,
            horaHoy.minute);
        widget.callback(_fecha!);
        _inputFieldDateController.text = formatter.format(_fecha!);
      });
    }
  }
}

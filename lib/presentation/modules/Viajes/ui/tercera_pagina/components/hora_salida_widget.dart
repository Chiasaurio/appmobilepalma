import 'package:apppalma/presentation/modules/Viajes/cubit/viaje_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HoraSalida extends StatefulWidget {
  const HoraSalida({Key? key}) : super(key: key);

  @override
  State<HoraSalida> createState() => _HoraSalidaState();
}

class _HoraSalidaState extends State<HoraSalida> {
  final TextEditingController _horasalidacontroller = TextEditingController();
  TimeOfDay? _horasalida;
  String? horasalidaString;
  final TimeOfDay _hora = TimeOfDay.now();

  _selectHorasalida(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _horasalida != null ? _horasalida! : _hora,
    );
    if (picked != null) {
      setState(() {
        _horasalida = picked;
        horasalidaString = _horasalida!.format(context);
        _horasalidacontroller.text = horasalidaString!;
        BlocProvider.of<ViajeCubit>(context).setHoraSalida(_horasalida!);
      });
    }
  }

  @override
  void initState() {
    _horasalida = _hora;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[buildBody()],
    );
  }

  Widget buildBody() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            readOnly: true,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.start,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text(
                "Hora de salida",
                style: TextStyle(fontSize: 15),
              ),
              contentPadding: EdgeInsets.only(left: 10),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
              ),
            ),
            enableInteractiveSelection: false,
            controller: _horasalidacontroller,
            onTap: () {
              _selectHorasalida(context);
            },
            validator: (value) {
              if (value == null) {
                return null;
              } else {
                return 'Este campo es necesario';
              }
            },
          ),
        ),
      ],
    );
  }
}

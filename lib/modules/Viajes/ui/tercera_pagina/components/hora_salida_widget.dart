import 'package:apppalma/modules/Viajes/cubit/viaje_cubit.dart';
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
      children: <Widget>[
        const Text('Hora de salida',
            style: TextStyle(color: Colors.black, fontSize: 16)),
        const SizedBox(
          height: 15,
        ),
        buildBody()
      ],
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
              suffixIcon: Icon(Icons.calendar_today),
              labelText: 'Hora de salida',
              labelStyle: TextStyle(fontSize: 18),
              // hintText: campo,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
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

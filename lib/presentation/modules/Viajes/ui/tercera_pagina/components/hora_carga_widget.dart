import 'package:apppalma/presentation/modules/Viajes/cubit/viaje_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HoraCarga extends StatefulWidget {
  const HoraCarga({Key? key}) : super(key: key);

  @override
  State<HoraCarga> createState() => _HoraCargaState();
}

class _HoraCargaState extends State<HoraCarga> {
  final TextEditingController _horacargacontroller = TextEditingController();
  TimeOfDay? _horacarga;
  String? horacargaString;
  final TimeOfDay _hora = TimeOfDay.now();

  _selectHoraCarga(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _horacarga != null ? _horacarga! : _hora,
    );
    if (picked != null) {
      setState(() {
        _horacarga = picked;
        horacargaString = _horacarga!.format(context);
        _horacargacontroller.text = horacargaString!;
        BlocProvider.of<ViajeCubit>(context).setHoraCarga(_horacarga!);
      });
    }
  }

  @override
  void initState() {
    _horacarga = _hora;
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
                "Hora de carga",
                style: TextStyle(fontSize: 15),
              ),
              contentPadding: EdgeInsets.only(left: 10),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
              ),
            ),
            enableInteractiveSelection: false,
            controller: _horacargacontroller,
            onTap: () {
              _selectHoraCarga(context);
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

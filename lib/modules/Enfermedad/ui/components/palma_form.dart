import 'package:apppalma/modules/Enfermedad/cubit/enfermedad_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/widgets/orientacion_dropdown.dart';

class PalmaDataForm extends StatefulWidget {
  final Function(String) validators;
  final Function() setState;
  final GlobalKey<FormState> formKey;
  const PalmaDataForm(
      {super.key,
      required this.formKey,
      required this.validators,
      required this.setState});

  @override
  State<PalmaDataForm> createState() => _PalmaDataFormState();
}

class _PalmaDataFormState extends State<PalmaDataForm> {
  int? lineaPalma;
  int? numeroPalma;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            label: Text(
              "Linea de palma",
              style: TextStyle(fontSize: 15),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            ),
          ),
          validator: widget.validators as String? Function(String?)?,
          onChanged: (String value) {
            setState(() {
              lineaPalma = int.tryParse(value);
              BlocProvider.of<EnfermedadCubit>(context)
                  .lineaDePalmaChanged(lineaPalma);
            });
            widget.setState();
          },
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            label: Text(
              "Número de palma",
              style: TextStyle(fontSize: 15),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            ),
          ),
          validator: widget.validators as String? Function(String?)?,
          onChanged: (String value) {
            setState(() {
              numeroPalma = int.tryParse(value);
              BlocProvider.of<EnfermedadCubit>(context)
                  .numeroDePalmaChanged(numeroPalma);
            });
            widget.setState();
          },
        ),
        const SizedBox(
          height: 15,
        ),
        OrientacionPalmaDropwdown(setState: widget.setState),
      ],
    );
  }
}

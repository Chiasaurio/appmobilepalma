import 'package:apppalma/presentation/modules/Erradicaciones/cubit/erradicacion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ObservacionesErradicacion extends StatelessWidget {
  const ObservacionesErradicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
      child: FormBuilderTextField(
        name: "causa",
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: const InputDecoration(
          label: Text(
            "Observaciones",
            style: TextStyle(fontSize: 15),
          ),
          contentPadding: EdgeInsets.only(left: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
          ),
        ),
        onChanged: (String? value) {
          BlocProvider.of<ErradicacionCubit>(context)
              .observacionesChanged(value!);
        },
      ),
    );
  }
}

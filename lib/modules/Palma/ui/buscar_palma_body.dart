import 'package:apppalma/constants.dart';
import 'package:apppalma/modules/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/modules/Palma/ui/components/palma_sin_registros_info.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:flutter/material.dart';
import 'package:apppalma/utils/utils.dart' as utils;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/palma_form.dart';
import 'components/palma_seleccionada_info.dart';

class BuscarPalmaBody extends StatefulWidget {
  const BuscarPalmaBody({super.key, required this.nombreLote});
  final String nombreLote;

  @override
  State<BuscarPalmaBody> createState() => _BuscarPalmaBodyState();
}

class _BuscarPalmaBodyState extends State<BuscarPalmaBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PalmaCubit, PalmaState>(
      builder: (context, state) {
        if (state.palmaSeleccionada != null) {
          return PalmaSeleccionadaInfo(palma: state.palmaSeleccionada!);
        } else {
          if (state.status == FormStatus.submissionSuccess ||
              state is ErradicacionSinCausa) {
            return const PalmaSinRegistrosInfo();
          } else {
            return getPalmaForm();
          }
        }
      },
    );
  }

  Padding getPalmaForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PalmaDataForm(
              formKey: _formKey,
              validators: (String? value) {
                if (utils.isNumeric(value!)) {
                  return null;
                } else {
                  return 'Ingrese la linea de la palma';
                }
              },
              setState: () {
                setState(() {});
              }),
          validateButton()
        ],
      ),
    );
  }

  validateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kpurpleColor),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            BlocProvider.of<PalmaCubit>(context).obtenerProcesosPalma();
          }
        },
        child: const Text('Buscar palma'),
      ),
    );
  }
}

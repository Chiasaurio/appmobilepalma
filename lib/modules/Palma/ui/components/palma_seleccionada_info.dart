import 'package:apppalma/modules/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/modules/Palma/ui/erradicacion/submit_erradicacion_button.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../domain/palma/models/palma_con_procesos_model.dart';
import '../../PalmaDetail/ui/components/card_palma.dart';
import '../../PalmaDetail/ui/components/list_registro_enfermedades.dart';

class PalmaSeleccionadaInfo extends StatefulWidget {
  final PalmaConProcesos palma;
  const PalmaSeleccionadaInfo({
    Key? key,
    required this.palma,
  }) : super(key: key);

  @override
  State<PalmaSeleccionadaInfo> createState() => _PalmaSeleccionadaInfoState();
}

class _PalmaSeleccionadaInfoState extends State<PalmaSeleccionadaInfo> {
  final _formKey = GlobalKey<FormBuilderState>();
  late bool buttonEnabled;
  @override
  void initState() {
    buttonEnabled = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PalmaCubit, PalmaState>(listener: (context, state) {
      if (state.status == FormStatus.submissionSuccess) {
        BlocProvider.of<PalmaCubit>(context).resetState();
        BlocProvider.of<PalmaCubit>(context)
            .obtenerPalmasLote(state.nombreLote!);
      }
    }, builder: (context, state) {
      return FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 30,
                  child: TextButton(
                      onPressed: () {
                        BlocProvider.of<PalmaCubit>(context).resetState();
                      },
                      child: const Text(
                        "Volver",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ))),
              CardPalma(palma: widget.palma.palma),
              RegistroEnfermedadesList(
                  registros: widget.palma.registroenfermedaddatos),
              erradicacionComponent(state)
            ],
          ),
        ),
      );
    });
  }

  Widget erradicacionComponent(PalmaState state) {
    if (state is ErradicacionConCausa) {
      return Column(
        children: [
          const SizedBox(
            height: 25.0,
          ),
          registrarCausa(),
          const SizedBox(
            height: 25.0,
          ),
          const SubmitErradicacionButton(
            enabled: true,
          ),
        ],
      );
    } else if (state is ErradicacionSinCausa) {
      return Column(
        children: [
          const SizedBox(
            height: 25.0,
          ),
          registrarCausa(),
          const SizedBox(
            height: 25.0,
          ),
          SubmitErradicacionButton(
            enabled: registrarErradicacionEnabled(),
          ),
        ],
      );
    } else {
      return palmaAcciones(context);
    }
  }

  Row palmaAcciones(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            onPressed: () {},
            child: const Text('Dar de alta'),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          onPressed: () {
            BlocProvider.of<PalmaCubit>(context).initErradicacion();
          },
          child: const Text('Erradicar'),
        ),
      ],
    );
  }

  FormBuilderTextField registrarCausa() {
    return FormBuilderTextField(
      name: "causa",
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        label: Text(
          "Por favor ingrese la causa",
          style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
        ),
        contentPadding: const EdgeInsets.only(left: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1, color: Colors.black.withOpacity(0.5)), //<-- SEE HERE
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          BlocProvider.of<PalmaCubit>(context).causaChanged(value);
        });
      },
    );
  }

  bool registrarErradicacionEnabled() {
    if ((_formKey.currentState?.validate() ?? false)) {
      return true;
    }
    return false;
  }
}

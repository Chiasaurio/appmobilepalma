import 'package:apppalma/modules/Enfermedad/cubit/enfermedad_cubit.dart';
import 'package:apppalma/modules/Enfermedad/ui/components/enfermedad_form.dart';
import 'package:apppalma/modules/Erradicaciones/ui/ErradicacionPage/components/orientacion_dropdown.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:flutter/material.dart';
import 'package:apppalma/utils/utils.dart' as utils;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/palma_form.dart';

class Body extends StatefulWidget {
  final String nombreLote;
  const Body({Key? key, required this.nombreLote}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<EnfermedadCubit, EnfermedadState>(
      listener: (context, state) {
        if (state.status == FormStatus.submissionSuccess) {
          BlocProvider.of<EnfermedadCubit>(context).resetState();
          BlocProvider.of<EnfermedadCubit>(context)
              .obtenerTodasEnfermedadesConEtapas();
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
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
                  enfermedadFormEnabled()
                      ? BlocBuilder<EnfermedadCubit, EnfermedadState>(
                          builder: (context, state) {
                            if (state.enfermedades != null) {
                              return EnfermedadDataForm(
                                  enfermedades: state.enfermedades,
                                  setState: () {
                                    setState(() {});
                                  });
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        )
                      : const SizedBox(),
                ],
              )),
        ),
      ),
    );
  }

  bool enfermedadFormEnabled() {
    if (_formKey.currentState?.validate() ?? false) {
      return true;
    }
    return false;
  }
}

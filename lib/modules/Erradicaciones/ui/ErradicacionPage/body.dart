import 'package:apppalma/modules/Erradicaciones/cubit/erradicacion_cubit.dart';
import 'package:apppalma/modules/Erradicaciones/ui/ErradicacionPage/components/erradicacion-con-causa-widget.dart';
import 'package:apppalma/modules/Erradicaciones/ui/ErradicacionPage/components/orientacion-dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apppalma/utils/utils.dart' as utils;

import 'components/erradicacion-sin-causa-widget.dart';

class Body extends StatefulWidget {
  final String nombreLote;
  const Body({Key? key, required this.nombreLote}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  int? lineaPalma;
  int? numeroPalma;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Form(
          key: _formKey,
          child: Column(
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
                validator: (value) {
                  if (utils.isNumeric(value!)) {
                    return null;
                  } else {
                    return 'Ingrese la linea de la palma';
                  }
                },
                onChanged: (String value) {
                  lineaPalma = int.tryParse(value);
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
                validator: (value) {
                  if (utils.isNumeric(value!)) {
                    return null;
                  } else {
                    return 'Ingrese el número de la palma';
                  }
                },
                onChanged: (String value) {
                  numeroPalma = int.tryParse(value);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const OrientacionPalmaDropwdown(),
              validateButton(),
              causaErradicacion(),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<ErradicacionCubit, ErradicacionState> validateButton() {
    return BlocBuilder<ErradicacionCubit, ErradicacionState>(
      builder: (context, state) {
        if (state is ValidandoPalma) {
          return Container(
            margin: const EdgeInsets.only(top: 20),
            height: 25,
            width: 25,
            child: const CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<ErradicacionCubit>(context).validarPalma(
                      widget.nombreLote, lineaPalma!, numeroPalma!);
                }
              },
              child: const Text('Validar'),
            ),
          );
        }
      },
    );
  }

  BlocBuilder<ErradicacionCubit, ErradicacionState> causaErradicacion() {
    return BlocBuilder<ErradicacionCubit, ErradicacionState>(
      builder: (context, state) {
        if (state.tieneCausa != null) {
          if (state.tieneCausa!) {
            return ErradicacionConCausaWidget(
              palma: state.palma!,
            );
          } else {
            return ErradicacionSinCausaWidget(
              palma: state.palma,
            );
          }
        }
        return const SizedBox();
      },
    );
  }
}

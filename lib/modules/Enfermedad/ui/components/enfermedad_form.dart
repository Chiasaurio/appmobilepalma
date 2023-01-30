import 'package:apppalma/modules/Enfermedad/ui/components/submit_enfermedad_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../moor/moor_database.dart';
import '../../../../moor/tables/enfermedades_table.dart';
import '../../cubit/enfermedad_cubit.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EnfermedadDataForm extends StatefulWidget {
  final Function() setState;
  const EnfermedadDataForm({super.key, required this.setState});

  @override
  State<EnfermedadDataForm> createState() => _EnfermedadDataFormState();
}

class _EnfermedadDataFormState extends State<EnfermedadDataForm> {
  int? lineaPalma;
  int? numeroPalma;
  bool advertenciaetapa = false;
  String? observaciones;
  EnfermedadConEtapas? enfermedadconetapas;
  Etapa? etapa;
  late List<EnfermedadConEtapas> enfermedades;
  final _formKey = GlobalKey<FormBuilderState>();
  final _radiokey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 10),
          buildEnfermedad(),
          buildEtapas(),
          advertenciaetapa
              ? const Text('Debe seleccionar una etapa',
                  style:
                      TextStyle(fontStyle: FontStyle.italic, color: Colors.red))
              : const SizedBox(),
          const SizedBox(height: 10),
          buildObservacion(),
          const SizedBox(
            height: 25,
          ),
          SubmitEnfermedadButton(
            enabled: registrarEnfermedadEnabled(),
          )
        ],
      ),
    );
  }

  bool registrarEnfermedadEnabled() {
    if (_formKey.currentState?.validate() ?? false) {
      return true;
    }
    return false;
  }

  Widget buildObservacion() {
    return Row(
      children: <Widget>[
        Expanded(
            child: FormBuilderTextField(
          name: "observacion",
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            label: Text(
              "Observaciones",
              style: TextStyle(fontSize: 15),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            ),
          ),
          onChanged: (String? value) {
            setState(() {
              BlocProvider.of<EnfermedadCubit>(context)
                  .observacionesChanged(value!);
            });
          },
          validator: (value) {
            if (value != null) {
              if (value.length < 5) {
                return 'Minimo 5 caracteres';
              }
              return null;
            } else {
              return 'Ingrese la causa';
            }
          },
        )),
      ],
    );
  }

  Widget buildEnfermedad() {
    return Row(
      children: <Widget>[
        Expanded(
          child: getEnfermedades(),
        ),
      ],
    );
  }

  Widget getEnfermedades() {
    return BlocBuilder<EnfermedadCubit, EnfermedadState>(
      builder: (context, state) {
        if (state.enfermedades != null) {
          enfermedades = state.enfermedades!;
          return _buildEnfermedad();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildEnfermedad() {
    List<DropdownMenuItem<EnfermedadConEtapas>> getOpcionesDropdown() {
      List<DropdownMenuItem<EnfermedadConEtapas>> lista = [];
      for (var ece in enfermedades) {
        lista.add(DropdownMenuItem(
          value: ece,
          child: Text(ece.enfermedad.nombreEnfermedad),
        ));
      }
      return lista;
    }

    return Row(children: <Widget>[
      Expanded(
        child: FormBuilderDropdown<EnfermedadConEtapas>(
          name: "enfermedad",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: const InputDecoration(
            label: Text(
              "Enfermedad",
              style: TextStyle(fontSize: 15),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            ),
          ),
          elevation: 5,
          isExpanded: true,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
          valueTransformer: (val) => val?.toString(),
          items: getOpcionesDropdown(),
          onChanged: (opt) async {
            setState(() {
              enfermedadconetapas = opt!;
              etapa = null;
              advertenciaetapa = false;
              BlocProvider.of<EnfermedadCubit>(context)
                  .enfermedadChange(enfermedadconetapas!.enfermedad);
            });

            await Future.delayed(const Duration(milliseconds: 200));
            if (_radiokey.currentState != null) {
              _radiokey.currentState!.reset();
            }
            widget.setState();
            if (!mounted) return;
            FocusScope.of(context).requestFocus(FocusNode());
          },
          validator: (value) =>
              value == null ? 'Este campo es requerido' : null,
        ),
      )
    ]);
  }

  Widget buildEtapas() {
    if (enfermedadconetapas != null) {
      if (enfermedadconetapas!.etapas.isNotEmpty) {
        return _buildEtapas();
      } else {
        return const SizedBox();
      }
    }
    return const SizedBox();
  }

  Widget _buildEtapas() {
    return FormBuilderRadioGroup<Etapa?>(
      key: _radiokey,
      autovalidateMode: AutovalidateMode.always,
      name: "etapa",
      decoration: const InputDecoration(
          labelText: 'Etapa', labelStyle: TextStyle(fontSize: 15)),
      onChanged: (e) {
        etapa = e;
        setState(() {
          BlocProvider.of<EnfermedadCubit>(context).etapaChanged(etapa);
        });
      },
      initialValue: null,
      validator: FormBuilderValidators.required(),
      options: enfermedadconetapas!.etapas
          .map((lang) => FormBuilderFieldOption(
                value: lang,
                child: Text(lang.nombreEtapa),
              ))
          .toList(growable: false),
    );
  }
}

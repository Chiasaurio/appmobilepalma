import 'package:apppalma/data/moor/tables/enfermedades_table.dart';
import 'package:apppalma/presentation/components/widgets/orientacion_dropdown.dart';
import 'package:apppalma/presentation/modules/Camera/imagenes_registro_widget.dart';
import 'package:apppalma/presentation/modules/Enfermedad/ui/components/submit_enfermedad_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:apppalma/data/moor/moor_database.dart';
import 'package:image_picker/image_picker.dart';
import '../../cubit/enfermedad_cubit.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EnfermedadForm extends StatefulWidget {
  final List<EnfermedadConEtapas>? enfermedades;
  final Function() setState;
  const EnfermedadForm({
    super.key,
    required this.setState,
    required this.enfermedades,
  });

  @override
  State<EnfermedadForm> createState() => _EnfermedadFormState();
}

class _EnfermedadFormState extends State<EnfermedadForm> {
  int? lineaPalma;
  int? numeroPalma;
  bool advertenciaetapa = false;
  String? observaciones;
  EnfermedadConEtapas? enfermedadconetapas;
  Etapa? etapa;
  late List<EnfermedadConEtapas> enfermedades;
  final _radiokey = GlobalKey<FormFieldState>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    enfermedades = List.from(widget.enfermedades!);
    enfermedades.add(EnfermedadConEtapas.otraEnfermedad());
    super.initState();
  }

  late EnfermedadCubit cubit;
  List<XFile> imagenes = [];
  @override
  Widget build(BuildContext context) {
    cubit = context.read<EnfermedadCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: FormBuilder(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Ubicación del foco',
                style: TextStyle(fontSize: 18),
              ),
              _ubicacionDelFoco(),
              const SizedBox(height: 20),
              const Text(
                'Datos de la enfermedad',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 15),
              buildEnfermedad(),
              const SizedBox(height: 15),
              if (enfermedadconetapas != null) buildEtapas(),
              const SizedBox(height: 15),
              const Text(
                'Observaciones',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 15),
              _observaciones(),
              const SizedBox(height: 15),
              const Text(
                'Imagenes',
                style: TextStyle(fontSize: 18),
              ),
              ImagenesRegistro(
                  imagenes: imagenes,
                  setImages: (List<XFile> nuevasImagenes) {
                    imagenes = nuevasImagenes;
                    cubit.changeImagenes(imagenes);
                    setState(() {});
                  }),
              const SizedBox(height: 15),
              SubmitEnfermedadButton(
                enabled: registrarEnfermedadEnabled,
              )
            ]),
      ),
    );
  }

  // bool registrarEnfermedadEnabled() {
  //   if (_formKey.currentState?.validate() ?? false) {
  //     return true;
  //   }
  //   return false;
  // }
  bool registrarEnfermedadEnabled() {
    if (_formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  Widget buildEnfermedad() {
    return Row(
      children: <Widget>[
        Expanded(
          child: _buildEnfermedad(),
        ),
      ],
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
          // autovalidateMode: AutovalidateMode.onUserInteraction,
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
            if (opt != null) {
              setState(() {
                enfermedadconetapas = opt;
                etapa = null;
                advertenciaetapa = false;
                BlocProvider.of<EnfermedadCubit>(context)
                    .enfermedadChange(enfermedadconetapas!.enfermedad);
              });
            }

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

  Widget _ubicacionDelFoco() {
    return Column(
      children: [
        const SizedBox(height: 15),
        FormBuilderTextField(
          onChanged: (value) => cubit.changeLinea(int.tryParse(value ?? '')),
          name: 'linea',
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 18),
          decoration: const InputDecoration(
            label: Text(
              "Linea",
              style: TextStyle(fontSize: 18),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            ),
          ),
          validator: (value) =>
              value == null || value == '' ? 'Este campo es requerido' : null,
        ),
        const SizedBox(height: 15),
        FormBuilderTextField(
          onChanged: (value) {
            if (value != null && value != '') {
              cubit.changeNumero(int.tryParse(value)!);
            }
          },
          name: 'numero',
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 18),
          decoration: const InputDecoration(
            label: Text(
              "Número",
              style: TextStyle(fontSize: 18),
            ),
            contentPadding: EdgeInsets.only(left: 10),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
            ),
          ),
          validator: (value) =>
              value == null || value == '' ? 'Este campo es requerido' : null,
        ),
        const SizedBox(height: 15),
        OrientacionPalmaDropwdown(setState: () {
          setState(() {});
        }, blocCall: (String value) {
          cubit.changeOrientacion(value);
        }),
      ],
    );
  }

  Widget _observaciones() {
    return FormBuilderTextField(
      onChanged: (value) {
        cubit.changeObservaciones(value ?? '');
      },
      name: 'observaciones',
      style: const TextStyle(fontSize: 18),
      decoration: const InputDecoration(
        label: Text(
          "Observaciones",
          style: TextStyle(fontSize: 18),
        ),
        contentPadding: EdgeInsets.only(left: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
        ),
      ),
    );
  }
}

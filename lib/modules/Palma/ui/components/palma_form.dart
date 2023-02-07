import 'package:apppalma/modules/Palma/cubit/palma_cubit.dart';
import 'package:apppalma/utils/form_status.dart';
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
  final TextEditingController _lineaController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<PalmaCubit, PalmaState>(
      listener: (context, state) {
        if (state.status == FormStatus.submissionSuccess) {
          // setState(() {
          //   _lineaController.text = "";
          //   _numeroController.text = "";
          //   widget.setState();
          // });
        }
      },
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _lineaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
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
                  _lineaController.text = value;
                  _lineaController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _lineaController.text.length));
                  BlocProvider.of<PalmaCubit>(context)
                      .lineaDePalmaChanged(int.tryParse(_lineaController.text));
                });
                widget.setState();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
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
                  _numeroController.text = value;
                  _numeroController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _numeroController.text.length));
                  BlocProvider.of<PalmaCubit>(context).numeroDePalmaChanged(
                      int.tryParse(_numeroController.text));
                });
                widget.setState();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            OrientacionPalmaDropwdown(setState: widget.setState),
          ],
        ),
      ),
    );
  }
}

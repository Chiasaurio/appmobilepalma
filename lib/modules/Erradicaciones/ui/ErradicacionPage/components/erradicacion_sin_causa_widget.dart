import 'package:apppalma/modules/Erradicaciones/ui/ErradicacionPage/components/submit_erradicacion_button.dart';
import 'package:apppalma/modules/Erradicaciones/ui/ErradicacionPage/components/validated_palma_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../moor/tables/palmas_table.dart';
import '../../../cubit/erradicacion_cubit.dart';

class ErradicacionSinCausaWidget extends StatefulWidget {
  final PalmaValidada? palma;
  const ErradicacionSinCausaWidget({Key? key, this.palma}) : super(key: key);

  @override
  State<ErradicacionSinCausaWidget> createState() =>
      _ErradicacionSinCausaWidgetState();
}

class _ErradicacionSinCausaWidgetState
    extends State<ErradicacionSinCausaWidget> {
  String? causa;
  PalmaValidada? palma;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    palma = widget.palma;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          palma != null
              ? PalmaValidadaInfo(palma: palma!)
              : const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("No hay informacion registrada de esta palma"),
                ),
          const SizedBox(
            height: 15,
          ),
          registrarCausa(),
          const SizedBox(
            height: 35,
          ),
          // registrarErradicacion()
          SubmitErradicacionButton(
            enabled: registrarErradicacionEnabled(),
          )
        ],
      ),
    );
  }

  TextFormField registrarCausa() {
    return TextFormField(
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        label: Text(
          "Por favor ingrese la causa",
          style: TextStyle(fontSize: 15),
        ),
        contentPadding: EdgeInsets.only(left: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
        ),
      ),
      validator: (value) {
        if (value != null) {
          if (value.length < 10) {
            return 'Minimo 10 caracteres';
          }
          return null;
        } else {
          return 'Ingrese la causa';
        }
      },
      onChanged: (String value) {
        setState(() {
          BlocProvider.of<ErradicacionCubit>(context).causaChanged(value);
        });
      },
    );
  }

  bool registrarErradicacionEnabled() {
    if (_formKey.currentState?.validate() ?? false) {
      return true;
    }
    return false;
  }
}

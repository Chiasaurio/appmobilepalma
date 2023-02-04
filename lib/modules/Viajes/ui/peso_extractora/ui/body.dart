import 'package:apppalma/modules/Viajes/ui/peso_extractora/cubit/peso_extractora_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime fechaviaje =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  int pesoExtractora = 0;

  final TextEditingController _pesoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 20, 0.0, 100),
        child: Column(children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Expanded(
                  child: Text(
                      'Por favor ingrese el peso tomado en la extractora en Kilogramos.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18, /*fontWeight: FontWeight.bold*/
                      )),
                ),
              ]),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: _buildPeso()),
                // Card(
                //   color: Colors.transparent,
                //   elevation: 5,
                //   child: GestureDetector(
                //     onTap: () {
                //       if (_unidades != null) {
                //         _unidades = !_unidades!;
                //       } else {
                //         _unidades = true;
                //       }
                //       BlocProvider.of<ViajeCubit>(context)
                //           .setHoraCarga(_horacarga!);

                //       setState(() {});
                //     },
                //     child: Container(
                //       height: 50,
                //       width: 50,
                //       decoration: BoxDecoration(
                //         color: _unidades != null && _unidades!
                //             ? Colors.white
                //             : Colors.grey,
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(10)),
                //       ),
                //       child: const Center(
                //           child: Text('Kg',
                //               style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: 22, /*fontWeight: FontWeight.bold*/
                //               ))),
                //     ),
                //   ),
                // ),
                // // Card(
                //   color: Colors.transparent,
                //   elevation: 5,
                //   child: GestureDetector(
                //     onTap: () {
                //       if (_unidades != null) {
                //         _unidades = !_unidades!;
                //       } else {
                //         _unidades = false;
                //       }
                //       setState(() {});
                //     },
                //     child: Container(
                //       height: 50,
                //       width: 50,
                //       decoration: BoxDecoration(
                //         color: _unidades != null && !_unidades!
                //             ? Colors.white
                //             : Colors.grey,
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(10)),
                //       ),
                //       child: const Center(
                //           child: Text('gr',
                //               style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: 22, /*fontWeight: FontWeight.bold*/
                //               ))),
                //     ),
                // ),
                // ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildPeso() {
    return TextFormField(
      onChanged: (e) {
        String s = e.replaceAll(RegExp(r'^0+(?=.)'), '');
        _pesoController.text = s;
        _pesoController
          ..text = s
          ..selection = TextSelection.fromPosition(TextPosition(
              offset: _pesoController.text.length,
              affinity: TextAffinity.upstream));
        if (s != '') {
          BlocProvider.of<PesoExtractoraCubit>(context)
              .setPesoExtractora(double.parse(s));
        } else {
          BlocProvider.of<PesoExtractoraCubit>(context).setPesoExtractora(0.0);
        }
      },
      controller: _pesoController,
      style: const TextStyle(fontSize: 25),
      textAlign: TextAlign.start,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        // suffixText: _unidades != null
        //     ? _unidades!
        //         ? 'Kg'
        //         : 'gr'
        //     : '',
        suffixText: 'Kg',
        labelText: 'Peso extractora',
        labelStyle: TextStyle(fontSize: 18),
        // hintText: campo,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      validator: (String? value) =>
          value != '' ? null : 'Debe ingresar un valor',
    );
  }
}

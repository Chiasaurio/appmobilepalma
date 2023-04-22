import 'package:apppalma/presentation/modules/Viajes/ui/peso_extractora/cubit/peso_extractora_cubit.dart';
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
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                          'Por favor ingrese el peso tomado en la extractora en Kilogramos.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16, /*fontWeight: FontWeight.bold*/
                          )),
                    ),
                  ]),
              const SizedBox(
                height: 20,
              ),
              Row(
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
      style: const TextStyle(fontSize: 17),
      textAlign: TextAlign.start,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        label: Text(
          "Peso extractora",
          style: TextStyle(fontSize: 15),
        ),
        suffixText: 'Kg',
        contentPadding: EdgeInsets.only(left: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
        ),
      ),
      validator: (String? value) =>
          value != '' ? null : 'Debe ingresar un valor',
    );
  }
}

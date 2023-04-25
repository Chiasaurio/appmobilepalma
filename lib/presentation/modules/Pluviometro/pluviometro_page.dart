import 'package:apppalma/presentation/components/widgets/drawer.dart';
import 'package:apppalma/presentation/components/widgets/fecha.dart';
import 'package:apppalma/presentation/components/widgets/header_gradient.dart';
import 'package:apppalma/presentation/modules/Pluviometro/cubit/pluviometro_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PluviometroPage extends StatefulWidget {
  final bool? disableBack;
  final String routeName;

  const PluviometroPage({super.key, this.disableBack, required this.routeName});

  @override
  State<PluviometroPage> createState() => _PluviometroPageState();
}

class _PluviometroPageState extends State<PluviometroPage> {
  final TextEditingController _cantidadController = TextEditingController();
  DateTime? fecha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideDrawer(),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          HeaderGradient(
              title: "Sincronizar",
              ruta: widget.routeName,
              disableBack:
                  widget.disableBack != null ? widget.disableBack! : false,
              showDrawer: true),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                TextFormField(
                  controller: _cantidadController,
                  style: const TextStyle(fontSize: 17),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text(
                      "Cantidad",
                      style: TextStyle(fontSize: 15),
                    ),
                    contentPadding: EdgeInsets.only(left: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Colors.grey), //<-- SEE HERE
                    ),
                  ),
                  validator: (String? value) =>
                      value != '' ? null : 'Debe ingresar un valor',
                ),
                const SizedBox(height: 10),
                FechaWidget(fecha: fecha, callback: callback),
                ElevatedButton.icon(
                  onPressed: () async {
                    print('hola');
                    if (_cantidadController.text != "" && fecha != null) {
                      final result =
                          await BlocProvider.of<PluviometroCubit>(context)
                              .agregarPrecipitacion(
                                  int.parse(_cantidadController.text), fecha!);

                      if (result) {
                        _cantidadController.text = "";
                        fecha = null;
                        setState(() {});
                      }
                    }
                  },
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Registrar precipitación'),
                )
              ],
            ),
          ),
        ])));
  }

  callback(DateTime f) {
    setState(() {
      fecha = f;
    });
  }
}

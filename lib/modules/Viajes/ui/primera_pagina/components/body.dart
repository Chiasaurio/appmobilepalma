import 'package:apppalma/constants.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/modules/Viajes/ui/peso_extractora/cubit/peso_extractora_cubit.dart';
import 'package:apppalma/modules/Viajes/ui/peso_extractora/ui/peso_extractora_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  final List<Viaje> viajesPendientes;
  const Body({Key? key, required this.viajesPendientes}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formatDate = DateFormat('MMM d, yyyy, h:mm a');
  @override
  Widget build(BuildContext context) {
    final viajes = widget.viajesPendientes;
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, right: 10, left: 10),
      child: Column(
        children: [
          const Text(
              'Seleccione uno de los viajes para registar el peso de la extractora',
              style: TextStyle(
                fontSize: 16,
              )),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 200),
              shrinkWrap: true,
              itemCount: viajes.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Fecha de salida: ${formatDate.format(viajes[index].horaSalida!)}',
                              style: const TextStyle(
                                fontSize: 16,
                              )),
                          Text('Kilos pesados: ${viajes[index].kilos}',
                              style: const TextStyle(
                                fontSize: 16,
                              )),
                          buildRegistrarPesoExtractora(viajes[index])
                        ],
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRegistrarPesoExtractora(Viaje viaje) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(0.0, 10, 10, 0.0),
        height: 25.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          color: kYellowColor,
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        child: const Center(
            child: Text(
          'Registrar peso extractora',
          style: TextStyle(color: Colors.black, fontSize: 16),
          textAlign: TextAlign.center,
        )),
      ),
      onTap: () {
        BlocProvider.of<PesoExtractoraCubit>(context)
            .initPesoExtractoraPage(viaje);
        // Navigator.pushNamed(context, '/lote');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PesoExtractoraPage(
              routeName: '/viajes/pesoextractora',
              viaje: viaje,
            ),
          ),
        );
      },
    );
  }
}

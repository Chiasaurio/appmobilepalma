import 'package:apppalma/data/moor/tables/registroenfermedad_table.dart';
import 'package:apppalma/presentation/modules/Tratamientos/cubit/tratamiento_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../Tratamientos/ui/tratamiento/tratamiento_page.dart';

class CensosEnfermedadesList extends StatelessWidget {
  final List<PalmaConEnfermedad> palmasEnfermas;
  final f = DateFormat('yyyy-MM-dd');
  CensosEnfermedadesList({super.key, required this.palmasEnfermas});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: palmasEnfermas.length,
          (context, index) {
        final palma = palmasEnfermas.elementAt(index);
        return Card(
          elevation: 2.0,
          margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Fecha registro:',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      f.format(palma.registroEnfermedad.fechaRegistro),
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Text('Linea:',
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.grey)),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${palma.palma.numerolinea}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: [
                        const Text('Numero:',
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.grey)),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${palma.palma.numeroenlinea}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Enfermedad:',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      ' ${palma.enfermedad.nombreEnfermedad}',
                      style:
                          const TextStyle(color: Colors.orange, fontSize: 14),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                if (palma.etapa != null)
                  Row(
                    children: [
                      const Text('Etapa:',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        ' ${palma.etapa!.nombreEtapa}',
                        style:
                            const TextStyle(color: Colors.orange, fontSize: 14),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                Row(
                  children: [
                    const Text('Estado palma:',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      ' ${palma.palma.estadopalma}',
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // TextButton(onPressed: () {}, child: Text("Dar de alta")),
                    TextButton(
                        onPressed: () {
                          BlocProvider.of<TratamientoCubit>(context)
                              .obtenerProductos(palma);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TratamientoPage()));
                        },
                        child: const Text("Tratamiento"))
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

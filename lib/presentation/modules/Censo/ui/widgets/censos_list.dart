import 'package:apppalma/data/moor/tables/registroenfermedad_table.dart';
import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/presentation/modules/Erradicaciones/cubit/erradicacion_cubit.dart';
import 'package:apppalma/presentation/modules/Erradicaciones/ui/erradicacion_page.dart';
import 'package:apppalma/presentation/modules/Tratamientos/cubit/tratamiento_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../Enfermedad/cubit/enfermedad_cubit.dart';
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
        final reversedIndex = palmasEnfermas.length - index - 1;
        final palma = palmasEnfermas.elementAt(reversedIndex);
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
                if (palma.palma.estadopalma == EstadosPalma.pendientePorTratar)
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
                  ),
                if (palma.palma.estadopalma ==
                    EstadosPalma.pendientePorErradicar)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // TextButton(onPressed: () {}, child: Text("Dar de alta")),
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<ErradicacionCubit>(context)
                                .initErradicacion(palma);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ErradicacionPage()));
                          },
                          child: const Text("Erradicación")),
                    ],
                  ),
                if (palma.palma.estadopalma == EstadosPalma.enTratamiento)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () async {
                            _darDeAltaDialog(context, palma);
                          },
                          child: const Text("Dar de alta"))
                    ],
                  )
              ],
            ),
          ),
        );
      }),
    );
  }

  void _darDeAltaDialog(BuildContext context, PalmaConEnfermedad palma) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('¿Seguro que desea dar de alta el registro?'),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Text(
                      'Linea: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(palma.palma.numerolinea.toString())
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Numero: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(palma.palma.numeroenlinea.toString())
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Orientación: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(palma.palma.orientacion.toString())
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Enfermedad: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      palma.enfermedad.nombreEnfermedad,
                    )
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cerrar')),
                    ElevatedButton(
                        onPressed: () async {
                          final res =
                              await BlocProvider.of<EnfermedadCubit>(context)
                                  .darDeAltaEnfermedad(
                                      palma: palma.palma,
                                      registroEnfermedad:
                                          palma.registroEnfermedad);
                          if (context.mounted) {
                            Navigator.of(context).pop();
                            if (res) {
                              BlocProvider.of<TratamientoCubit>(context)
                                  .obtenerPalmasEnfermas(
                                      palma.palma.nombreLote);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: kSuccessColor,
                                  content: Text(
                                      'Se dió de alta el registro correctamente.'),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: kRedColor,
                                  content:
                                      Text('Error realizando el registro.'),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Confirmar')),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

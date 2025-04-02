import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/presentation/modules/Fumigaciones/cubit/fumigacion_cubit.dart';
import 'package:apppalma/presentation/modules/Fumigaciones/ui/fumigacion/registrar_fumigacion_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';

import '../../../Censo/cubit/censos_cubit.dart';

class CensosPlagaList extends StatelessWidget {
  final List<CensoData> censosPendientes;
  CensosPlagaList({super.key, required this.censosPendientes});
  final f = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: censosPendientes.length,
          (context, index) {
        final censo = censosPendientes.elementAt(index);
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
                      f.format(censo.fechaCenso),
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Plaga:',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      ' ${censo.nombrePlaga}',
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Text('Estado',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                    Text(
                      ' ${censo.estadoPlaga}',
                      style:
                          const TextStyle(color: Colors.orange, fontSize: 14),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                if (censo.estadoPlaga == EstadosPlaga.pendientePorFumigar)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<CensosCubit>(context)
                                .censoPendienteEscogido(censo);
                            BlocProvider.of<FumigacionCubit>(context)
                                .obtenerProductos(censo);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrarFumigacionPage()));
                          },
                          child: const Text("Fumigación"))
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

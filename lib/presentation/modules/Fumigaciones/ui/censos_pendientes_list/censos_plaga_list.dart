// import 'package:apppalma/presentation/modules/Censo/cubit/censos_cubit.dart';
// import 'package:apppalma/data/moor/moor_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apppalma/presentation/constants.dart';
import 'package:apppalma/presentation/modules/Fumigaciones/cubit/fumigacion_cubit.dart';
import 'package:apppalma/presentation/modules/Fumigaciones/ui/fumigacion/registrar_fumigacion_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// class CensosPlagaList extends StatefulWidget {
//   // final Future<List<CensoData>> future;
//   final List<CensoData> censosPendientes;
//   const CensosPlagaList({Key? key, required this.censosPendientes})
//       : super(key: key);

//   @override
//   State<CensosPlagaList> createState() => _CensosPlagaListState();
// }

// class _CensosPlagaListState extends State<CensosPlagaList> {
//   late double width;
//   late double height;
//   late double altoCard;
//   late double anchoCard;
//   late double margin;
//   final f = DateFormat('yyyy-MM-dd');

//   @override
//   Widget build(BuildContext context) {
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//     altoCard = height * 0.4; //150,
//     anchoCard = width * 0.7;
//     margin = anchoCard * 0.04;
//     final List<CensoData> censos = widget.censosPendientes;
//     return SliverList(
//         delegate: SliverChildBuilderDelegate((context, index) {
//       return makeListaCensos(censos[index]);
//     }, childCount: censos.length));
//     // return ListView.builder(
//     //     shrinkWrap: true,
//     //     itemCount: censos.length,
//     //     itemBuilder: (BuildContext context, int index) {
//     //       return makeListaCensos(censos[index]);
//     //     });
//   }

//   Widget makeListaCensos(CensoData censo) {
//     return GestureDetector(
//       onTap: () {
//         // BlocProvider.of<TratamientoCubit>(context).obtenerProductos(palma);
//         // BlocProvider.of<FumigacionCubit>(context).obtenerProductos(censo);
// BlocProvider.of<CensosCubit>(context).censoPendienteEscogido(censo);
// // Navigator.pushNamed(context, '/lote/plagas/registrarfumigacion');
//       },
//       child: Card(
//           elevation: 2.0,
//           margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(margin, margin, 0.0, margin),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 contenidoCenso(censo),
//                 // TextButton(
//                 //   onPressed: () {
//                 //     censoseleccionado = censo;
//                 //     _opcionesBottomSheet(context);
//                 //   },
//                 //   child: const Icon(Icons.more_vert),
//                 // )
//               ],
//             ),
//           )),
//     );
//   }

//   Widget contenidoCenso(CensoData censo) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Row(
//           children: <Widget>[
// const Text('Fecha registro:',
//     style: TextStyle(fontSize: 16.0, color: Colors.grey)),
// Text(
//   f.format(censo.fechaCenso),
//   style: const TextStyle(color: Colors.black, fontSize: 18),
//   textAlign: TextAlign.start,
// ),
//           ],
//         ),
//         SizedBox(height: margin * 0.5),
//         Row(
//           children: <Widget>[
// const Text('Plaga:',
//     style: TextStyle(fontSize: 16.0, color: Colors.grey)),
// Text(
//   ' ${censo.nombrePlaga}',
//   style: const TextStyle(color: Colors.black, fontSize: 18),
//   textAlign: TextAlign.start,
// ),
//           ],
//         ),
//         SizedBox(height: margin * 0.5),
//         Row(
//           children: <Widget>[
//             const Text('Sector',
//                 style: TextStyle(fontSize: 16.0, color: Colors.grey)),
//             Text(
//               // ' ${censo.lineaLimite1} - ${censo.lineaLimite2}',
//               censo.identificador,
//               style: const TextStyle(color: Colors.black, fontSize: 18),
//               textAlign: TextAlign.start,
//             ),
//           ],
//         ),
// Row(
//   children: <Widget>[
//     const Text('Estado',
//         style: TextStyle(fontSize: 16.0, color: Colors.grey)),
//     Text(
//       ' ${censo.estadoPlaga}',
//       style: const TextStyle(color: Colors.orange, fontSize: 18),
//       textAlign: TextAlign.start,
//     ),
//   ],
// ),
//       ],
//     );
//   }
// }

import 'package:apppalma/data/moor/moor_database.dart';
import 'package:flutter/material.dart';

import '../../../Censo/cubit/censos_cubit.dart';

class CensosPlagaList extends StatelessWidget {
  final List<CensoData> censosPendientes;
  CensosPlagaList({Key? key, required this.censosPendientes}) : super(key: key);
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
                // Row(
                //   children: [
                //     Row(
                //       children: [
                //         const Text('Linea:',
                //             style:
                //                 TextStyle(fontSize: 14.0, color: Colors.grey)),
                //         const SizedBox(
                //           width: 5,
                //         ),
                //         Text(
                //           '${censo.numerolinea}',
                //           style: const TextStyle(
                //               color: Colors.black, fontSize: 14),
                //           textAlign: TextAlign.start,
                //         ),
                //       ],
                //     ),
                //     const SizedBox(
                //       width: 15,
                //     ),
                //     Row(
                //       children: [
                //         const Text('Numero:',
                //             style:
                //                 TextStyle(fontSize: 14.0, color: Colors.grey)),
                //         const SizedBox(
                //           width: 5,
                //         ),
                //         Text(
                //           '${palma.palma.numeroenlinea}',
                //           style: const TextStyle(
                //               color: Colors.black, fontSize: 14),
                //           textAlign: TextAlign.start,
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
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
                // if (palma.etapa != null)
                //   Row(
                //     children: [
                //       const Text('Etapa:',
                //           style: TextStyle(fontSize: 14.0, color: Colors.grey)),
                //       const SizedBox(
                //         width: 5,
                //       ),
                //       Text(
                //         ' ${palma.etapa!.nombreEtapa}',
                //         style:
                //             const TextStyle(color: Colors.orange, fontSize: 14),
                //         textAlign: TextAlign.start,
                //       )
                //     ],
                //   ),
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
                      // TextButton(onPressed: () {}, child: Text("Dar de alta")),
                      TextButton(
                          onPressed: () {
                            BlocProvider.of<CensosCubit>(context)
                                .censoPendienteEscogido(censo);
                            // Navigator.pushNamed(context, '/lote/plagas/registrarfumigacion');
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

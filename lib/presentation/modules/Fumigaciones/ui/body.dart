// import 'package:apppalma/data/moor/moor_database.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class FumigacionPage extends StatefulWidget {
//   @override
//   _FumigacionPageState createState() => _FumigacionPageState();
// }

// class _FumigacionPageState extends State<FumigacionPage> {
//   late List<CensoData> censos;
//   CensoData? censoseleccionado;
//   final f = DateFormat('yyyy-MM-dd');

//   late double width;
//   late double height;
//   late double altoCard;
//   late double anchoCard;
//   late double margin;

//   @override
//   Widget build(BuildContext context) {
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//     altoCard = height * 0.4; //150,
//     anchoCard = width * 0.95;
//     margin = anchoCard * 0.04;

//     return ListView(children: <Widget>[
//       Padding(
//           padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
//           child: Column(children: <Widget>[
//             buildCensosPlaga(),
//             // Container(
//             //   margin: EdgeInsets.all(margin),
//             //   width: anchoCard,
//             //   // padding: EdgeInsets.fromLTRB(15.0, 10.0, 0, 10.0),
//             //   child: Row(
//             //       mainAxisAlignment: MainAxisAlignment.center,
//             //       children: <Widget>[
//             //         Expanded(
//             //           child: Text('Lista de censos:',
//             //               textAlign: TextAlign.start,
//             //               style: TextStyle(
//             //                   color: Colors.black,
//             //                   fontSize: 18,
//             //                   fontWeight: FontWeight.bold)),
//             //         ),
//             //       ]),
//             // ),
//             // Container(
//             //   height: height * 0.6,
//             //   width: anchoCard,
//             //   decoration: BoxDecoration(
//             //     border: Border.all(
//             //       color: Colors.black,
//             //       width: 1,
//             //     ),
//             //     // borderRadius: BorderRadius.circular(12),
//             //   ),
//             //   child: getCensosPlaga(),
//             // ),
//             SizedBox(height: altoCard * 0.1),
//             buildContinuar(context),
//           ]))
//     ]);
//   }

//   Widget buildCensosPlaga() {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Expanded(
//               child: Text(
//                 "Lista de censos fumigados",
//                 style: TextStyle(
//                     color: Colors.black87.withOpacity(0.8),
//                     fontSize: 25,
//                     fontWeight: FontWeight.w600),
//               ),
//             )
//           ],
//         ),
//         const SizedBox(height: 20),
//         LimitedBox(
//           maxWidth: width,
//           maxHeight: 300.0,
//           child: getCensosPlaga(),
//         ),
//         const Divider(
//           color: Colors.black,
//         ),
//       ],
//     );
//   }

//   Widget getCensosPlaga() {
//     return StreamBuilder<List<CensoData>>(
//       stream: censoBloc.censospendientesStream,
//       builder: (context, snapshot) {
//         if (snapshot.data != null) {
//           censos = snapshot.data;
//           print('censos');
//           print(snapshot.data);
//           return dataBody(context);
//           // return Text('hola');
//         } else {
//           return Text('cargando');
//         }
//         // return cosecha != null? CosechaActivaVista( cosecha: cosecha ) : NuevaCosechaPage(  nombrelote: nombrelote );
//       },
//     );
//   }

//   ListView dataBody(BuildContext context) {
//     return ListView.builder(
//         // padding: const EdgeInsets.all(8),
//         itemCount: censos.length,
//         itemBuilder: (BuildContext context, int index) {
//           return makeListaCensos(censos[index]);
//         });
//   }
//   // value: censoseleccionado != null? censoseleccionado.id == censo.id? true : false : false,

//   Widget makeListaCensos(CensoData censo) {
//     return Column(
//       children: [
//         Container(
//             child: Padding(
//           padding: EdgeInsets.fromLTRB(margin, margin, 0.0, margin),
//           child: Row(
//             children: <Widget>[
//               contenidoCenso(censo),
//               Column(
//                 // crossAxisAlignment: CrossAxisAlignment.end,
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     // padding: EdgeInsets.fromLTRB(anchoCard*0.2, 0.0, 0.0, 0.0),
//                     width: anchoCard * 0.4,
//                     child: Checkbox(
//                         value: censoseleccionado != null
//                             ? censoseleccionado.idCenso == censo.idCenso
//                                 ? true
//                                 : false
//                             : false,
//                         onChanged: (bool value) {
//                           setState(() {
//                             censoseleccionado = censo;
//                           });
//                         }),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         )),
//         Divider(color: Colors.black),
//       ],
//     );
//   }

//   Widget contenidoCenso(CensoData censo) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Text('Fecha registro:',
//                 style: TextStyle(fontSize: 16.0, color: Colors.grey)),
//             Text(
//               f.format(censo.fechaCenso),
//               style: TextStyle(color: Colors.black, fontSize: 18),
//               textAlign: TextAlign.start,
//             ),
//           ],
//         ),
//         SizedBox(height: margin * 0.5),
//         Row(
//           children: <Widget>[
//             Text('Plaga:',
//                 style: TextStyle(fontSize: 16.0, color: Colors.grey)),
//             Text(
//               ' ${censo.nombrePlaga}',
//               style: TextStyle(color: Colors.black, fontSize: 18),
//               textAlign: TextAlign.start,
//             ),
//           ],
//         ),
//         SizedBox(height: margin * 0.5),
//         // Row(
//         //   children: <Widget>[
//         //     Text('Etapa', style: TextStyle(fontSize: 16.0, color: Colors.grey)),
//         //     Text(' ${censo.etapaPlaga}', style: TextStyle(color: Colors.black, fontSize: 18), textAlign: TextAlign.start,),
//         //   ],
//         // ),
//         SizedBox(height: margin * 0.5),
//         Row(
//           children: <Widget>[
//             Text('Sector',
//                 style: TextStyle(fontSize: 16.0, color: Colors.grey)),
//             Text(
//               ' ${censo.lineaLimite1} - ${censo.lineaLimite2}',
//               style: TextStyle(color: Colors.black, fontSize: 18),
//               textAlign: TextAlign.start,
//             ),
//           ],
//         ),
//         Row(
//           children: <Widget>[
//             Text('Estado',
//                 style: TextStyle(fontSize: 16.0, color: Colors.grey)),
//             Text(
//               ' ${censo.estadoPlaga}',
//               style: TextStyle(color: Colors.orange, fontSize: 18),
//               textAlign: TextAlign.start,
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget buildContinuar(BuildContext context) {
//     return RaisedButton(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       disabledColor: Colors.grey[300],
//       disabledTextColor: Colors.grey[50],
//       child: Text(
//         'Continuar',
//         style: TextStyle(color: Colors.black, fontSize: 16),
//       ),
//       color: Colors.blue[100],
//       onPressed: censoseleccionado != null
//           ? () {
//               censoBloc.obtenerCensosPendientes();
//               Navigator.pushNamed(
//                   context, 'lote/aplicaciones/fumigacion/registrarfumigacion',
//                   arguments: censoseleccionado);
//             }
//           : null,
//     );
//   }
// }

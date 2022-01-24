// import 'dart:convert';

// import 'package:apppalma/moor/moor_database.dart';
// import 'package:drift/drift.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:json_annotation/json_annotation.dart';

// class SyncPlagas {
//   lateList dataplagas = [];
//   Map<String, dynamic> dataplagasmap = [];

//   Future<List<Insertable<Plaga>>> getPlagas() async {
//     http.Response response = await http.get('http://10.0.2.2:3000/plagas');
//     // debugPrint(response.body);
//     dataplagas = json.decode(response.body);
//     List<Insertable<Plaga>> plagas = new List<Insertable<Plaga>>();
//     dataplagas.forEach((element) {
//       PlagasCompanion aux = PlagasCompanion(
//         nombreComunPlaga: Value(element['nombre_comun_plaga']),
//       );
//       plagas.add(aux);
//     });
//     return plagas;
//   }

//   Future<List<Insertable<EtapasPlagaData>>> getEtapasPlagas() async {
//     http.Response response =
//         await http.get('http://10.0.2.2:3000/plagas-etapas');
//     // debugPrint(response.body);
//     dataplagas = json.decode(response.body);
//     List<Insertable<EtapasPlagaData>> etapasplaga =
//         new List<Insertable<EtapasPlagaData>>();
//     dataplagas.forEach((element) {
//       EtapasPlagaCompanion aux = EtapasPlagaCompanion(
//         nombreEtapa: Value(element['nombre_etapa_plaga']),
//         nombrePlaga: Value(element['nombre_comun_plaga']),
//         procedimientoEtapa: Value(element['procedimiento_etapa_plaga']),
//       );
//       etapasplaga.add(aux);
//     });
//     return etapasplaga;
//   }
// }

import 'dart:convert';

import 'package:apppalma/moor/moor_database.dart';
import 'package:drift/drift.dart';
import 'package:http/http.dart' as http;

class SyncEnfermedades {
  final _baseUrl = 'http://10.0.2.2:3000';
  final token =
      'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOnsiY2NfdXN1YXJpbyI6IjEwOTg3NjU0MzIiLCJyb2wiOiJhZG1pbiJ9LCJpYXQiOjE2MzYyMjc5OTksIm5iZiI6MTYzNjIyNzk5OSwiZXhwIjoxNjM2MzE0Mzk5fQ.QlP3UBCcsQZci651UedSSUohCZ8mIvhiQT7_wPxCS9lmzaWiLnUvWBSPpWUSL8DefbN8Ux0fsuOHBwB6kzPH_kOA7_njyTPPSvDK2eD0eu-EFsOzpxveOZBkvOUCM__IWbjvbImDXzAbYrMqpX1GtxC8qCuTExOgkBNglOtzlJE';

  Future<List<Insertable<Enfermedade>>> getEnfermedadesRemoteSource() async {
    List dataenfermedades;
    var url = Uri.parse('$_baseUrl/enfermedadesTodas');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    dataenfermedades = json.decode(response.body);
    List<Insertable<Enfermedade>> enfermedades = [];
    dataenfermedades.forEach((element) {
      EnfermedadesCompanion aux = EnfermedadesCompanion(
          nombreEnfermedad: Value(element['nombre_enfermedad']),
          procedimientoEnfermedad: Value(
              element['procedimiento_tratamiento_enfermedad'] ??
                  'no tiene procedimiento'));
      enfermedades.add(aux);
    });
    return enfermedades;
  }

  // postRegistrosDeEnfermedadYTratamientos() async {
  //   final palmas = await palmasBloc.obtenerTodasPalmas();
  //   final registrosenfermedades = await palmasBloc.obtenerEnfermedades();
  //   final registrostratamientos = await palmasBloc.obtenerTratamientos();

  //   List palmasjson = new List();
  //   palmas.forEach((element) {
  //     print(element);
  //     print(element.runtimeType);
  //     palmasjson.add(jsonEncode(element.toJson()));
  //   });
  //   // List enfermedadesjson = new List();
  //   // registrosenfermedades.forEach((element) {
  //   //   enfermedadesjson.add(element.toJsonString());
  //   // });
  //   // List tratamientosjson = new List();
  //   // registrostratamientos.forEach((element) {
  //   //   tratamientosjson.add(element.toJsonString());
  //   // });
  //   palmasjson.forEach((element) {
  //     print(jsonEncode(element));
  //     print(element.runtimeType);
  //   });

  //   var client = http.Client();

  //   try {
  //     var palmasResponse = await client
  //         .post('http://10.0.2.2:3000/palmas', headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     }, body: {
  //       palmasjson[0]
  //     });
  //     print(palmasResponse);
  //     //   //   var enfermedadesResponse = await client.post('http://10.0.2.2:3000/registrosenfermedad',
  //     //   //     body: {enfermedadesjson});
  //     //   //     print(enfermedadesResponse);
  //     //   //   var tratamientosResponse = await client.post('http://10.0.2.2:3000/registrostratamiento',
  //     //   //     body: {tratamientosjson});
  //     //   //     print(tratamientosResponse);
  //   } finally {
  //     client.close();
  //   }
  // }

  List encondeToJson(List<Palma> list) {
    List jsonList = [];
    list.map((item) => jsonList.add(item.toJson())).toList();
    return jsonList;
  }

  Future<List<Insertable<Etapa>>> getEtapasEnfermedades() async {
    List dataetapas;
    var url = Uri.parse('$_baseUrl/enfermedad-etapas');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // debugPrint(response.body);
    dataetapas = json.decode(response.body);
    List<Insertable<Etapa>> etapas = [];
    dataetapas.forEach((element) {
      EtapasCompanion aux = EtapasCompanion(
          nombreEnfermedad: Value(element['nombre_enfermedad']),
          nombreEtapa: Value(element['etapa_enfermedad']),
          procedimientoEtapa: Value(element['tratamiento_etapa_enfermedad']));
      etapas.add(aux);
    });
    return etapas;
  }
}

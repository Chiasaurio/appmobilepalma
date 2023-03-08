import 'package:apppalma/data/api.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';

class SyncEnfermedades {
  final Api _apiInstance = Api.getInstance();

  Future<List<Insertable<Enfermedade>>> getEnfermedadesRemoteSource() async {
    try {
      List dataenfermedades;
      final resp = await _apiInstance.get('enfermedadesTodas');
      dataenfermedades = resp['data'];
      List<Insertable<Enfermedade>> enfermedades = [];
      for (var element in dataenfermedades) {
        EnfermedadesCompanion aux = EnfermedadesCompanion(
            nombreEnfermedad: Value(element['nombre_enfermedad']),
            procedimientoEnfermedad: Value(
                element['procedimiento_tratamiento_enfermedad'] ??
                    'no tiene procedimiento'));
        enfermedades.add(aux);
      }
      return enfermedades;
    } catch (e) {
      return [];
    }
  }

  Future<List<Insertable<Etapa>>> getEtapasEnfermedades() async {
    List dataetapas;
    final resp = await _apiInstance.get('enfermedad-etapas');
    dataetapas = resp['data'];
    List<Insertable<Etapa>> etapas = [];
    for (var element in dataetapas) {
      EtapasCompanion aux = EtapasCompanion(
          id: Value(element['id_etapa_enfermedad']),
          nombreEnfermedad: Value(element['nombre_enfermedad']),
          nombreEtapa: Value(element['etapa_enfermedad']),
          procedimientoEtapa: Value(element['tratamiento_etapa_enfermedad']));
      etapas.add(aux);
    }
    return etapas;
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
}

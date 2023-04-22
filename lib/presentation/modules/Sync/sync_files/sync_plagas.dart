import 'package:apppalma/data/api.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';

class SyncPlagas {
  final Api _apiInstance = Api.getInstance();

  Future<List<Insertable<Plaga>>> getPlagas() async {
    List dataplagas;
    final resp = await _apiInstance.get('plagasTodas');
    dataplagas = resp['data'];
    List<Insertable<Plaga>> plagas = [];
    for (var element in dataplagas) {
      PlagasCompanion aux = PlagasCompanion(
        nombreComunPlaga: Value(element['nombre_comun_plaga']),
      );
      plagas.add(aux);
    }
    return plagas;
  }

  Future<List<Insertable<EtapasPlagaData>>> getEtapasPlagas() async {
    List dataetapas;
    final resp = await _apiInstance.get('plagas');
    dataetapas = resp['data'];
    List<Insertable<EtapasPlagaData>> etapasplaga = [];
    for (var element in dataetapas) {
      EtapasPlagaCompanion aux = EtapasPlagaCompanion(
        idEtapasPlaga: Value(element['id_etapa_plaga']),
        nombreEtapa: Value(element['nombre_etapa_plaga']),
        nombrePlaga: Value(element['nombre_comun_plaga']),
        procedimientoEtapa: Value(element['procedimiento_etapa_plaga']),
      );
      etapasplaga.add(aux);
    }
    return etapasplaga;
  }
}

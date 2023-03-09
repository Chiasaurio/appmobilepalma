import 'package:apppalma/data/api.dart';
import 'package:apppalma/data/constants/endpoints.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:dio/dio.dart';

class SyncToServerRemote {
  SyncToServerRemote();
  final Api _apiInstance = Api.getInstance();
  Future<bool> syncPalmas(List<Palma> palmas) async {
    try {
      final data = palmas
          .map((e) => {
                "numero_linea": e.numerolinea,
                "numero_en_linea": e.numeroenlinea,
                "nombre_lote": e.nombreLote,
                "orientacion_palma": e.orientacion,
                "estado_palma": e.estadopalma,
                "id_palma": e.identificador,
                "edad_palma": 0
              })
          .toList();
      await _apiInstance.post(EndPointConstant.palmas, data: {"data": data});
      return true;
    } on DioError catch (_) {
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> syncEnfermedades(List<RegistroEnfermedadData> registros) async {
    try {
      final data = registros
          .map((e) => {
                "hora_registro_enfermedad": e.horaRegistro!.toIso8601String(),
                "fecha_registro_enfermedad": e.fechaRegistro.toIso8601String(),
                "observacion_registro_enfermedad": e.observaciones,
                "id_palma": e.idPalma,
                "nombre_enfermedad": e.nombreEnfermedad,
                "id_etapa_enfermedad": e.idEtapaEnfermedad,
                "responsable": e.responsable,
              })
          .toList();
      await _apiInstance
          .post(EndPointConstant.enfermedades, data: {"data": data});
      return true;
    } on DioError catch (_) {
      return false;
    } catch (e) {
      return false;
    }
  }
}

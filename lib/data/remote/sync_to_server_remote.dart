import 'dart:convert';

import 'package:apppalma/data/api.dart';
import 'package:apppalma/data/constants/endpoints.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/data/moor/tables/tables.dart';
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

  Future<Map<String, dynamic>> syncEnfermedades(
      List<RegistroEnfermedadConImagenes> registros) async {
    try {
      final data = registros.map((e) {
        final registroEnfermedad = {
          // "id_registro_enfermedad": e.registroEnfermedad.idRegistroEnfermedad,
          "hora_registro_enfermedad":
              e.registroEnfermedad.horaRegistro!.toIso8601String(),
          "fecha_registro_enfermedad":
              e.registroEnfermedad.fechaRegistro.toIso8601String(),
          "observacion_registro_enfermedad": e.registroEnfermedad.observaciones,
          "id_palma": e.registroEnfermedad.idPalma,
          "nombre_enfermedad":
              utf8.encode(e.registroEnfermedad.nombreEnfermedad),
          "id_etapa_enfermedad": e.registroEnfermedad.idEtapaEnfermedad,
          "cc_usuario": e.registroEnfermedad.responsable,
        };
        var imagenes = e.imagenes
            .map((d) => {
                  'id_registro_enfermedad': d.idEnfermedad,
                  'imagen': base64Encode(d.imagen)
                })
            .toList();
        return {
          "registro_enfermedad": registroEnfermedad,
          "imagenes": imagenes
        };
      }).toList();
      final res = await _apiInstance
          .post(EndPointConstant.enfermedades, data: {"data": data});

      return res;
    } on DioError catch (_) {
      return {"success": false};
    } catch (e) {
      return {"success": false};
    }
  }

  Future<List<int>> getRegistroEnfermedadesIds(
      List<RegistroEnfermedadData> registrosEnfermedad) async {
    try {
      final data = registrosEnfermedad.map((e) {
        return {
          "fecha_registro_enfermedad": e.fechaRegistro.toIso8601String(),
          "hora_registro_enfermedad": e.horaRegistro!.toIso8601String(),
          "id_palma": e.idPalma
        };
      }).toList();

      final res = await _apiInstance.post(
          EndPointConstant.registroenfermedadesobtenerid,
          data: {"data": data});
      if (res["results"] != null) {
        return List<int>.from(res["results"]);
      } else {
        throw Exception('Error del servidor');
      }
    } on DioError catch (_) {
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<bool> syncTratamientos(List<RegistroTratamientoData> registros) async {
    try {
      final data = registros
          .map((e) => {
                "id_tratamiento": e.id,
                "hora_tratamiento": e.fechaRegistro.toIso8601String(),
                "fecha_tratamiento": e.fechaRegistro.toIso8601String(),
                "descripcion_procedimiento": e.descripcionProcedimiento,
                "id_registro_enfermedad": e.idRegistroEnfermedad,
                "id_agroquimico": e.idProductoAgroquimico,
                "dosis": e.dosis,
                "unidades": e.unidades,
                "tipo_control": utf8.encode(e.tipoControl),
                "cc_usuario": e.responsable,
              })
          .toList();
      await _apiInstance
          .post(EndPointConstant.tratamientos, data: {"data": data});

      return true;
    } on DioError catch (_) {
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> syncCosechasConDiarias(
      List<CosechaConCosechasDiarias> registros) async {
    try {
      final data = registros.map((e) {
        final cosecha = {
          'idCosecha': e.cosecha.idCosecha,
          'nombre_lote': utf8.encode(e.cosecha.nombreLote),
          'fecha_ingreso': e.cosecha.fechaIngreso.toIso8601String(),
          'fecha_salida': e.cosecha.fechaSalida?.toIso8601String(),
          'cantidad_racimos': e.cosecha.cantidadRacimos,
          'kilos': e.cosecha.kilos,
          'idViaje': e.cosecha.idViaje,
          'estadoCosecha': e.cosecha.completada ? 'FINALIZADA' : 'ACTIVA',
        };

        var diarias = e.cosechasdiarias
            .map((d) => {
                  'id_cosecha': d.idCosecha,
                  'id_cosecha_diaria': d.id,
                  'fecha_cosecha': d.fechaIngreso.toIso8601String(),
                  'kilos_racimos_dia': d.kilos,
                  'cantidad_racimos_dia': d.cantidadRacimos,
                  'cc_usuario': d.responsable,
                })
            .toList();
        return {"cosecha": cosecha, "diarias": diarias};
      }).toList();
      final res = await _apiInstance
          .post(EndPointConstant.cosechas, data: {"data": data});

      return res;
    } on DioError catch (_) {
      return {"success": false};
    } catch (e) {
      return {"success": false};
    }
  }

  Future<Map<String, dynamic>> syncPlateosConDiarias(
      List<PlateoConPlateosDiarias> registros) async {
    try {
      final data = registros.map((e) {
        final cosecha = {
          'idPlateos': e.plateo.idPlateo,
          'nombre_lote': utf8.encode(e.plateo.nombreLote),
          'fecha_ingreso': e.plateo.fechaIngreso.toIso8601String(),
          'fecha_salida': e.plateo.fechaSalida?.toIso8601String(),
          'cantidad_plateada': e.plateo.cantidadPlateada,
          'estadoPlateo': e.plateo.completado ? 'FINALIZADA' : 'ACTIVA',
        };

        var diarias = e.plateosDiarias
            .map((d) => {
                  'id_plateos': d.idPlateo,
                  'id_plateo_diario': d.id,
                  'fecha_plateo_diario': d.fecha.toIso8601String(),
                  'cantidad_plateo_diario': d.cantidadPlateada,
                  'tipo_plateo': utf8.encode(d.tipoPlateo),
                  'cc_usuario': d.responsable,
                })
            .toList();
        return {"plateo": cosecha, "diarias": diarias};
      }).toList();
      final res = await _apiInstance
          .post(EndPointConstant.plateos, data: {"data": data});
      return res;
    } on DioError catch (_) {
      return {"success": false};
    } catch (e) {
      return {"success": false};
    }
  }

  Future<Map<String, dynamic>> syncPodasConDiarias(
      List<PodasConPodasDiarias> registros) async {
    try {
      final data = registros.map((e) {
        final poda = {
          'idPoda': e.poda.idPoda,
          'nombre_lote': utf8.encode(e.poda.nombreLote),
          'fecha_ingreso': e.poda.fechaIngreso.toIso8601String(),
          'fecha_salida': e.poda.fechaSalida?.toIso8601String(),
          'cantidad_podada': e.poda.cantidadPodada,
          'estadoPoda': e.poda.completada ? 'FINALIZADA' : 'ACTIVA',
        };

        var diarias = e.podasDiarias
            .map((d) => {
                  'id_poda': d.idPoda,
                  'id_poda_diaria': d.id,
                  'fecha_poda_diaria': d.fechaIngreso.toIso8601String(),
                  'cantidad_poda_diaria': d.cantidadPodada,
                  'cc_usuario': d.responsable,
                })
            .toList();
        return {"poda": poda, "diarias": diarias};
      }).toList();
      final res =
          await _apiInstance.post(EndPointConstant.podas, data: {"data": data});
      return res;
    } on DioError catch (_) {
      return {"success": false};
    } catch (e) {
      return {"success": false};
    }
  }

  Future<Map<String, dynamic>> syncFertilizacionesConDiarias(
      List<FertilizacionConFertilizacionesDiarias> registros) async {
    try {
      final data = registros.map((e) {
        final fertilizacion = {
          'idFertilizacion': e.fertilizacion.idFertilizacion,
          'nombre_lote': utf8.encode(e.fertilizacion.nombreLote),
          'fecha_ingreso': e.fertilizacion.fechaIngreso.toIso8601String(),
          'fecha_salida': e.fertilizacion.fechaSalida?.toIso8601String(),
          'cantidad_fertilizada': e.fertilizacion.cantidadFertilizada,
          'estadoFertilizacion':
              e.fertilizacion.completado ? 'FINALIZADA' : 'ACTIVA',
        };

        var diarias = e.fertilizacionesDiarias
            .map((d) => {
                  'id_fertilizacion': d.idFertilizacion,
                  'id_fertilizacion_diaria': d.id,
                  'fecha_fertilizacion_diaria': d.fecha.toIso8601String(),
                  'cantidad_fertilizacion_diaria': d.cantidadFertilizada,
                  'dosis': d.dosis,
                  'unidades': d.unidades,
                  'nombre_fertilizante': d.nombreFertilizante,
                  'cc_usuario': d.responsable,
                })
            .toList();
        return {"fertilizacion": fertilizacion, "diarias": diarias};
      }).toList();
      final res = await _apiInstance
          .post(EndPointConstant.fertilizaciones, data: {"data": data});
      return res;
    } on DioError catch (_) {
      return {"success": false};
    } catch (e) {
      return {"success": false};
    }
  }

  Future<Map<String, dynamic>> syncViajes(List<Viaje> viajes) async {
    try {
      final data = viajes
          .map((e) => {
                "idViaje": e.idViaje,
                "kilos_total_racimos_extractora": e.kilosExtractora,
                "kilos_total_racimos_finca": e.kilos,
                "hora_cargue": e.horaCargue.toIso8601String(),
                "hora_salida": e.horaSalida!.toIso8601String(),
                "cc_usuario": e.responsable,
                "fecha_viaje": e.horaSalida!.toIso8601String(),
              })
          .toList();
      final res = await _apiInstance
          .post(EndPointConstant.viajes, data: {"data": data});
      return res;
    } on DioError catch (_) {
      return {"success": false};
    } catch (e) {
      return {"success": false};
    }
  }
}

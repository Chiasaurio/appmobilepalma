// import 'dart:convert';

// import 'package:apppalma/data/api.dart';
// import 'package:apppalma/data/constants/endpoints.dart';
// import 'package:apppalma/data/moor/moor_database.dart';
// import 'package:apppalma/data/moor/tables/tables.dart';
// import 'package:dio/dio.dart';

// class SyncToServerRemote {
//   SyncToServerRemote();
//   final Api _apiInstance = Api.getInstance();
//   Future<bool> syncPalmas(List<Palma> palmas) async {
//     try {
//       final data = palmas
//           .map((e) => {
//                 "numero_linea": e.numerolinea,
//                 "numero_en_linea": e.numeroenlinea,
//                 "nombre_lote": e.nombreLote,
//                 "orientacion_palma": e.orientacion,
//                 "estado_palma": e.estadopalma,
//                 "id_palma": e.identificador,
//                 "edad_palma": 0
//               })
//           .toList();
//       await _apiInstance.post(EndPointConstant.palmas, data: {"data": data});
//       return true;
//     } on DioException catch (_) {
//       return false;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future<bool> syncEnfermedades(List<RegistroEnfermedadData> registros) async {
//     try {
//       final data = registros
//           .map((e) => {
//                 "id_registro_enfermedad": e.id,
//                 "hora_registro_enfermedad": e.horaRegistro!.toIso8601String(),
//                 "fecha_registro_enfermedad": e.fechaRegistro.toIso8601String(),
//                 "observacion_registro_enfermedad": e.observaciones,
//                 "id_palma": e.idPalma,
//                 "nombre_enfermedad": utf8.encode(e.nombreEnfermedad),
//                 "id_etapa_enfermedad": e.idEtapaEnfermedad,
//                 "responsable": e.responsable,
//               })
//           .toList();
//       await _apiInstance
//           .post(EndPointConstant.enfermedades, data: {"data": data});

//       return true;
//     } on DioException catch (_) {
//       return false;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future<bool> syncTratamientos(List<RegistroTratamientoData> registros) async {
//     try {
//       final data = registros
//           .map((e) => {
//                 "id_tratamiento": e.id,
//                 "hora_tratamiento": e.fechaRegistro.toIso8601String(),
//                 "fecha_tratamiento": e.fechaRegistro.toIso8601String(),
//                 "descripcion_procedimiento": e.descripcionProcedimiento,
//                 "id_registro_enfermedad": e.idRegistroEnfermedad,
//                 "id_agroquimico": e.idProductoAgroquimico,
//                 "dosis": e.dosis,
//                 "unidades": e.unidades,
//                 "tipo_control": utf8.encode(e.tipoControl),
//                 "responsable": e.responsable,
//               })
//           .toList();
//       await _apiInstance
//           .post(EndPointConstant.tratamientos, data: {"data": data});

//       return true;
//     } on DioException catch (_) {
//       return false;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future<bool> syncCosechasConDiarias(
//       List<CosechaConCosechasDiarias> registros) async {
//     try {
//       final data = registros.map((e) {
//         final cosecha = {
//           'id_cosecha': e.cosecha.id,
//           'nombre_lote': utf8.encode(e.cosecha.nombreLote),
//           'fecha_ingreso': e.cosecha.fechaIngreso.toIso8601String(),
//           'fecha_salida': e.cosecha.fechaSalida?.toIso8601String(),
//           'cantidad_racimos': e.cosecha.cantidadRacimos,
//           'kilos': e.cosecha.kilos,
//           'id_viaje': e.cosecha.idViaje,
//           'estado_cosecha': e.cosecha.completada ? 'FINALIZADA' : 'ACTIVA',
//         };

//         var diarias = e.cosechasdiarias
//             .map((d) => {
//                   'id_cosecha': d.idCosecha,
//                   'id_cosecha_diaria': d.id,
//                   'fecha_cosecha': d.fechaIngreso.toIso8601String(),
//                   'kilos_racimos_dia': d.kilos,
//                   'cantidad_racimos_dia': d.cantidadRacimos,
//                   'responsable': d.responsable,
//                 })
//             .toList();
//         return {"cosecha": cosecha, "diarias": diarias};
//       }).toList();
//       await _apiInstance.post(EndPointConstant.cosechas, data: {"data": data});
//       return true;
//     } on DioException catch (_) {
//       return false;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future<bool> syncPlateosConDiarias(
//       List<PlateoConPlateosDiarias> registros) async {
//     try {
//       final data = registros.map((e) {
//         final plateo = {
//           'id_plateo': e.plateo.id,
//           'nombre_lote': utf8.encode(e.plateo.nombreLote),
//           'tipo_plateo': utf8.encode(e.plateo.tipoPlateo),
//           'fecha_ingreso': e.plateo.fechaIngreso.toIso8601String(),
//           'fecha_salida': e.plateo.fechaSalida?.toIso8601String(),
//           'cantidad_plateada': e.plateo.cantidadPlateada,
//           'estado_plateo': e.plateo.completado ? 'FINALIZADA' : 'ACTIVA',
//         };

//         var diarias = e.plateosDiarias
//             .map((d) => {
//                   'id_plateos': d.idPlateo,
//                   'id_plateo_diario': d.id,
//                   'fecha_plateo_diario': d.fecha.toIso8601String(),
//                   'cantidad_plateo_diario': d.cantidadPlateada,
//                   'linea_inicio': d.lineaInicio,
//                   'numero_inicio': d.numeroInicio,
//                   'orientacion_inicio': d.orientacionInicio,
//                   'linea_fin': d.lineaFin,
//                   'numero_fin': d.numeroFin,
//                   'orientacion_fin': d.orientacionFin,
//                   'responsable': d.responsable,
//                 })
//             .toList();
//         return {"plateo": plateo, "diarias": diarias};
//       }).toList();
//       await _apiInstance.post(EndPointConstant.plateos, data: {"data": data});
//       return true;
//     } on DioException catch (_) {
//       return false;
//     } catch (e) {
//       return false;
//     }
//   }

//   Future<bool> syncPodasConDiarias(List<PodasConPodasDiarias> registros) async {
//     try {
//       final data = registros.map((e) {
//         final poda = {
//           'id_poda': e.poda.id,
//           'nombre_lote': utf8.encode(e.poda.nombreLote),
//           'fecha_ingreso': e.poda.fechaIngreso.toIso8601String(),
//           'fecha_salida': e.poda.fechaSalida?.toIso8601String(),
//           'cantidad_podada': e.poda.cantidadPodada,
//           'estado_poda': e.poda.completada ? 'FINALIZADA' : 'ACTIVA',
//         };

//         var diarias = e.podasDiarias
//             .map((d) => {
//                   'id_poda': d.idPoda,
//                   'id_poda_diaria': d.id,
//                   'fecha_poda_diaria': d.fechaIngreso.toIso8601String(),
//                   'cantidad_poda_diaria': d.cantidadPodada,
//                   'responsable': d.responsable,
//                 })
//             .toList();
//         return {"poda": poda, "diarias": diarias};
//       }).toList();
//       await _apiInstance.post(EndPointConstant.podas, data: {"data": data});
//       return true;
//     } on DioException catch (_) {
//       return false;
//     } catch (e) {
//       return false;
//     }
//   }
// }

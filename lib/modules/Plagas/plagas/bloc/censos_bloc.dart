// import 'dart:async';


// // import 'package:sqflite/sqflite.dart';

// class CensosBloc {
//   static final CensosBloc _singleton = new CensosBloc._();
//   final AppDatabase db = AppDatabase();

//   factory CensosBloc() {
//     return _singleton;
//   }
//   CensosBloc._() {
//     //Obtener Cosechas de la Base de datos
//     // obtenerTodosCensos();
//     // obtenerTodosLotesWithProcesos();
//   }

//   final _censosController = BehaviorSubject<List<CensoData>>();
//   final _censospendientesController = BehaviorSubject<List<CensoData>>();
//   final _censosfumigadosController = BehaviorSubject<List<CensoData>>();

//   // Stream<List<Plaga>> get enfermedadesStream => _plagasConEtapasController.stream;
//   Stream<List<CensoData>> get censosactivosStream => _censosController.stream;
//   Stream<List<CensoData>> get censospendientesStream =>
//       _censospendientesController.stream;
//   Stream<List<CensoData>> get censosfumigadosStream =>
//       _censosfumigadosController.stream;

//   dispose() {
//     // _enfermedadesController?.close();
//     _censosController?.close();
//     _censospendientesController.close();
//     _censosfumigadosController.close();
//   }

//   obtenerTodosCensos() async {
//     final PlagasDao plagasDao = db.plagasDao;
//     List<CensoData> censos = await plagasDao.obtenerTodosCensos();
//     _censosController.sink.add(censos);
//   }

//   Future<List<CensoData>> obtenerCensos() async {}

//   obtenerCensosPendientes() async {
//     final PlagasDao plagasDao = db.plagasDao;
//     List<CensoData> censos = await plagasDao.getCensosPendientes();
//     _censospendientesController.sink.add(censos);
//   }

//   obtenerCensosFumigados() async {
//     final PlagasDao plagasDao = db.plagasDao;
//     List<CensoData> censos = await plagasDao.getCensosFumigados();
//     _censosfumigadosController.sink.add(censos);
//   }

//   daraltaCenso(CensoData censo) {
//     final PlagasDao plagasDao = db.plagasDao;
//     plagasDao.updateCenso(censo.copyWith(estadoPlaga: 'eliminado'));
//     obtenerCensosFumigados();
//   }

//   insertarCenso(
//       DateTime fechacenso,
//       bool presencialote,
//       bool presenciasector,
//       int linealimite1,
//       int linealimite2,
//       String observacion,
//       String nombreCientifico,
//       String nombrelote,
//       List<EtapasPlagaData> etapasseleccionadas) async {
//     final PlagasDao plagaDao = db.plagasDao;
//     try {
//       await plagaDao.insertCensoDePlaga(
//           fechacenso,
//           presencialote,
//           presenciasector,
//           linealimite1,
//           linealimite2,
//           observacion,
//           nombreCientifico,
//           nombrelote,
//           etapasseleccionadas);
//     } catch (e) {
//       registroFallidoToast(e.toString());
//     }
//   }
// }

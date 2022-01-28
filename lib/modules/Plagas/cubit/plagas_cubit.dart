import 'package:apppalma/components/toasts/toasts.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/moor/daos/plagas_daos.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/enfermedades_table.dart';
import 'package:apppalma/moor/tables/plagas_table.dart';
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';

part 'plagas_state.dart';

class PlagasCubit extends Cubit<PlagasState> {
  PlagasCubit() : super(PlagasInitial());
  final db = getIt<AppDatabase>();

  addPlagayEtapasFromServerToLocal(Map<String, List> map) async {
    List<Insertable<Plaga>> plagas = map["plagas"] as List<Insertable<Plaga>>;
    List<Insertable<EtapasPlagaData>> etapas =
        map["etapas"] as List<Insertable<EtapasPlagaData>>;
    final PlagasDao plagasDao = db.plagasDao;
    await plagasDao.insertPlagas(plagas, etapas);
  }

  Future<void> obtenerTodasPlagasConEtapas() async {
    final PlagasDao plagasDao = db.plagasDao;
    List<PlagaConEtapas> plagas = await plagasDao.obtenerPlagaConEtapas();
    emit(PlagasConEtapasLoaded(plagas: plagas));
  }

  Future<void> insertarCenso(
      DateTime fechacenso,
      bool presencialote,
      bool presenciasector,
      int linealimite1,
      int linealimite2,
      String observacion,
      String nombreCientifico,
      String nombrelote,
      List<EtapasPlagaData> etapasseleccionadas) async {
    final PlagasDao plagaDao = db.plagasDao;
    try {
      await plagaDao.insertCensoDePlaga(
          fechacenso,
          presencialote,
          presenciasector,
          linealimite1,
          linealimite2,
          observacion,
          nombreCientifico,
          nombrelote,
          etapasseleccionadas);
    } catch (e) {
      print('1 $e');
      registroFallidoToast(e.toString());
    }
  }
}

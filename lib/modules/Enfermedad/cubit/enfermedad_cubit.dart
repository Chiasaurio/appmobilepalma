import 'package:apppalma/main.dart';
import 'package:apppalma/moor/daos/enfermedades_dao.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/enfermedades_table.dart';
import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'enfermedad_state.dart';

class EnfermedadCubit extends Cubit<EnfermedadState> {
  EnfermedadCubit() : super(EnfermedadInitial());
  final db = getIt<AppDatabase>();

  Future<void> obtenerEnfermedades() async {
    // final EnfermedadesDao enfermedadDao = db.enfermedadesDao;
    // List<Enfermedade> enfermedades = await enfermedadDao.getEnfermedades();
    // emit(EnfermedadesLoaded(enfermedades: enfermedades));
  }

  Future<void> obtenerTodasEnfermedadesConEtapas() async {
    final EnfermedadesDao enfermedadDao = db.enfermedadesDao;
    List<EnfermedadConEtapas> enfermedades =
        await enfermedadDao.obtenerEnfermedadConEtapas();
    emit(EnfermedadesConEtapasLoaded(enfermedades: enfermedades));
  }

  addEnfermedadyEtapasFromServerToLocal(Map<String, List> map) async {
    List<Insertable<Enfermedade>> enfermedades =
        map["enfermedades"] as List<Insertable<Enfermedade>>;
    List<Insertable<Etapa>> etapas = map["etapas"] as List<Insertable<Etapa>>;
    final EnfermedadesDao enfermedadDao = db.enfermedadesDao;
    await enfermedadDao.addEnfermedades(enfermedades, etapas);
  }
}

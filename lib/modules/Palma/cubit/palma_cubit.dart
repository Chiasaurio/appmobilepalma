import 'package:apppalma/modules/Palma/PalmaDetail/registrospalma.dart';
import 'package:apppalma/components/toasts/toasts.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/moor/daos/enfermedades_dao.dart';
import 'package:apppalma/moor/daos/palma_daos.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'palma_state.dart';

class PalmaCubit extends Cubit<PalmaState> {
  final db = getIt<AppDatabase>();
  PalmaCubit() : super(PalmaInitial());

  Future<void> insertarPalmaConEnfermedad(
      String nombrelote,
      int numerolinea,
      int numeroenlinea,
      DateTime fecha,
      String nombreEnfermedad,
      int? idEtapa,
      String tratamiento,
      String observaciones) async {
    final PalmaDao palmaDao = db.palmaDao;
    try {
      palmaDao.insertarPalmaConEnfermedad(
          nombrelote,
          numerolinea,
          numeroenlinea,
          fecha,
          nombreEnfermedad,
          idEtapa,
          tratamiento,
          observaciones);
      registroExitosoToast();
    } catch (e) {
      registroFallidoToast('Error al realizar el registro');
    }
  }

  obtenerPalmasLote(String nombrelote) async {
    final PalmaDao palmaDao = db.palmaDao;
    final palmas = await palmaDao.obtenerPalmas(nombrelote);
    emit(PalmasLoteLoaded(palmas: palmas));
  }

  Future<PalmaConProcesos> obtenerProcesosPalma(Palma palma) async {
    final PalmaDao palmaDao = db.palmaDao;
    final EnfermedadesDao enfermedadDao = db.enfermedadesDao;
    final List<RegistroEnfermedadData> registroenfermedad =
        await palmaDao.obtenerRegistroEnfermedad(palma);
    List<RegistroEnfermedadDatos> registroenfermedaddatos = [];
    for (var r in registroenfermedad) {
      Enfermedade? enfermedad;
      Etapa? etapa;
      RegistroTratamientoData? registrotratamiento;
      enfermedad = await enfermedadDao.obtenerEnfermedad(r.nombreEnfermedad);
      if (r.idEtapaEnfermedad != null) {
        etapa = await enfermedadDao.obtenerEtapa(r.idEtapaEnfermedad!);
      }
      registrotratamiento = await palmaDao.obtenerTratamiento(r);

      final registroConDatos = RegistroEnfermedadDatos(
          registroenfermedad: r,
          etapa: etapa,
          enfermedad: enfermedad,
          registrotratamiento: registrotratamiento);
      registroenfermedaddatos.add(registroConDatos);
    }

    PalmaConProcesos palmaconprocesos = PalmaConProcesos(
        palma: palma, registroenfermedaddatos: registroenfermedaddatos);

    return palmaconprocesos;
  }
}

class PalmaArguments {
  final String nombrelote;
  final int numerolinea;
  final int numeroenlinea;

  PalmaArguments(this.nombrelote, this.numerolinea, this.numeroenlinea);
}

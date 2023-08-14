import 'package:apppalma/data/moor/daos/daos.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/presentation/components/toasts/toasts.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../sync_files/sync_files.dart';

part 'bajar_info_state.dart';

enum SyncStatus { initial, loading, success, error }

class BajarInfoCubit extends Cubit<BajarInfoState> {
  BajarInfoCubit() : super(const BajarInfoState());
  final db = getIt<AppDatabase>();
  DateFormat f = DateFormat('EEEE, d MMMM y', 'es');

  SyncLotes synclotes = SyncLotes();
  SyncEnfermedades syncenfermedades = SyncEnfermedades();
  SyncPlagas syncplagas = SyncPlagas();
  SyncProductosAgroquimicos syncproductos = SyncProductosAgroquimicos();
  SyncFertilizantes syncFertilizantes = SyncFertilizantes();

  void getFechasUltimaActualizacion() async {
    emit(const BajarInfoState());
    //Obtener fechas ultima actualización.
    final loteFechaUltimaActualizacion =
        await getLotesFechaUltimaActualizacion();
    final plagaFechaUltimaActualizacion =
        await getPlagasFechaUltimaActualizacion();
    final enfermedadFechaUltimaActualizacion =
        await getEnfermedadesFechaUltimaActualizacion();
    final agroquimicoFechaUltimaActualizacion =
        await getAgroquimicosFechaUltimaActualizacion();
    final fertilzanteFechaUltimaActualizacion =
        await getFertilizantesFechaUltimaActualizacion();
    emit(state.copyWith(
      loteFechaUltimaActualizacion: loteFechaUltimaActualizacion,
      plagaFechaUltimaActualizacion: plagaFechaUltimaActualizacion,
      enfermedadFechaUltimaActualizacion: enfermedadFechaUltimaActualizacion,
      agroquimicoFechaUltimaActualizacion: agroquimicoFechaUltimaActualizacion,
      fertilizanteFechaUltimaActualizacion: fertilzanteFechaUltimaActualizacion,
    ));
  }

  Future<String> getLotesFechaUltimaActualizacion() async {
    try {
      final LoteDao loteDao = db.loteDao;
      final ultimoLote = await loteDao.getLoteUltimo();
      if (ultimoLote != null) {
        return f.format(ultimoLote.fechaUltimaActualizacion!);
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  Future<String> getPlagasFechaUltimaActualizacion() async {
    try {
      final PlagasDao plagasDao = db.plagasDao;
      final ultimoLote = await plagasDao.getPlagaUltimo();
      if (ultimoLote != null) {
        return f.format(ultimoLote.fechaUltimaActualizacion!);
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  Future<String> getEnfermedadesFechaUltimaActualizacion() async {
    try {
      final EnfermedadesDao enfermedadesDao = db.enfermedadesDao;
      final ultimoLote = await enfermedadesDao.getEnfermedadesUltimo();
      if (ultimoLote != null) {
        return f.format(ultimoLote.fechaUltimaActualizacion!);
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  Future<String> getAgroquimicosFechaUltimaActualizacion() async {
    try {
      final ProductoAgroquimicoDao productoAgroquimicoDao =
          db.productoAgroquimicoDao;
      final ultimoLote =
          await productoAgroquimicoDao.getProductoAgroquimicoUltimo();
      if (ultimoLote != null) {
        return f.format(ultimoLote.fechaUltimaActualizacion!);
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  Future<String> getFertilizantesFechaUltimaActualizacion() async {
    try {
      final FertilizanteDao fertilizanteDao = db.fertilizanteDao;
      final ultimo = await fertilizanteDao.getFertilizanteUltimo();
      if (ultimo != null) {
        return f.format(ultimo.fechaUltimaActualizacion!);
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  void bajarRegistrosDelServidor() async {
    if (state.estadoLote != SyncStatus.loading) {
      await syncLotesRemote();
    }
    if (state.estadoEnfermedad != SyncStatus.loading) {
      await syncEnfermedadesRemote();
    }
    if (state.estadoPlaga != SyncStatus.loading) {
      await syncPlagasRemote();
    }
    if (state.estadoAgroquimico != SyncStatus.loading) {
      await syncAgroquimicosRemote();
    }
    if (state.estadoFertilizante != SyncStatus.loading) {
      await syncFertilizantesRemote();
    }
  }

  Future<void> syncLotesRemote() async {
    try {
      emit(state.copyWith(estadoLote: SyncStatus.loading));
      final LoteDao loteDao = db.loteDao;
      List<Insertable<Lote>> datalotes = await synclotes.getLotesRemoteSource();
      await loteDao.addLotes(datalotes);
      emit(state.copyWith(estadoLote: SyncStatus.success));
    } catch (e) {
      emit(state.copyWith(estadoLote: SyncStatus.error));
      registroFallidoToast('Error agregando los lotes ${e.toString()}');
    }
  }

  Future<void> syncEnfermedadesRemote() async {
    try {
      emit(state.copyWith(estadoEnfermedad: SyncStatus.loading));
      final EnfermedadesDao enfermedadDao = db.enfermedadesDao;
      List<Insertable<Enfermedade>> dataenfermedades =
          await syncenfermedades.getEnfermedadesRemoteSource();
      List<Insertable<Etapa>> dataetapas =
          await syncenfermedades.getEtapasEnfermedades();
      await enfermedadDao.addEnfermedades(dataenfermedades, dataetapas);
      emit(state.copyWith(estadoEnfermedad: SyncStatus.success));
    } catch (e) {
      emit(state.copyWith(estadoEnfermedad: SyncStatus.error));
      registroFallidoToast('Error agregando las enfermedades ${e.toString()}');
    }
  }

  Future<void> syncPlagasRemote() async {
    try {
      emit(state.copyWith(estadoPlaga: SyncStatus.loading));
      final PlagasDao plagasDao = db.plagasDao;
      List<Insertable<Plaga>> dataplagas = await syncplagas.getPlagas();
      List<Insertable<EtapasPlagaData>> dataetapas =
          await syncplagas.getEtapasPlagas();
      await plagasDao.insertPlagas(dataplagas, dataetapas);
      emit(state.copyWith(estadoPlaga: SyncStatus.success));
    } catch (e) {
      emit(state.copyWith(estadoPlaga: SyncStatus.error));
      registroFallidoToast('Error agregando las plagas ${e.toString()}');
    }
  }

  Future<void> syncAgroquimicosRemote() async {
    try {
      emit(state.copyWith(estadoAgroquimico: SyncStatus.loading));
      final ProductoAgroquimicoDao productoAgroquimicoDao =
          db.productoAgroquimicoDao;
      List<Insertable<ProductoAgroquimicoData>> dataproductos =
          await syncproductos.getProductos();
      if (dataproductos.isEmpty) {
        emit(state.copyWith(estadoAgroquimico: SyncStatus.error));
      } else {
        await productoAgroquimicoDao.insertProductos(dataproductos);
        emit(state.copyWith(estadoAgroquimico: SyncStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(estadoAgroquimico: SyncStatus.error));
      registroFallidoToast('Error agregando los agroquimicos ${e.toString()}');
    }
  }

  Future<void> syncFertilizantesRemote() async {
    try {
      emit(state.copyWith(estadoAgroquimico: SyncStatus.loading));
      final FertilizanteDao fertilizanteDao = db.fertilizanteDao;
      List<Insertable<FertilizanteData>> datafertilizantes =
          await syncFertilizantes.getFertilizantes();
      if (datafertilizantes.isEmpty) {
        emit(state.copyWith(estadoFertilizante: SyncStatus.error));
      } else {
        await fertilizanteDao.insertFertilizantes(datafertilizantes);
        emit(state.copyWith(estadoFertilizante: SyncStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(estadoFertilizante: SyncStatus.error));
      registroFallidoToast('Error agregando los fertilizantes ${e.toString()}');
    }
  }
}

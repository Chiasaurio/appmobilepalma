import 'package:apppalma/modules/LotesList/cubit/loteslist_cubit.dart';
import 'package:apppalma/modules/Sync/sync_files/sync_enfermedades.dart';
import 'package:apppalma/modules/Sync/sync_files/sync_lotes.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SyncBloc {
  SyncLotes synclotes = SyncLotes();
  SyncEnfermedades syncenfermedades = SyncEnfermedades();
  // SyncPlagas syncplagas = SyncPlagas();
  // SyncProductosAgroquimicos syncproductos = SyncProductosAgroquimicos();

  List<Insertable<Etapa>> dataetapasenfermedades = [];
  List<Insertable<Plaga>> dataplagas = [];
  List<Insertable<EtapasPlagaData>> dataetapasplaga = [];

  Future<List<Insertable<Lote>>> insertarLotes() async {
    try {
      List<Insertable<Lote>> datalotes = await synclotes.getLotesRemoteSource();
      return datalotes;
      // BlocProvider.of<LoteslistCubit>(context).obtenerTodosLotesWithProcesos();
    } catch (e) {
      return [];
    }
  }

  Future<Map<String, List>> insertarEnfermedades() async {
    try {
      List<Insertable<Enfermedade>> dataenfermedades =
          await syncenfermedades.getEnfermedadesRemoteSource();
      List<Insertable<Etapa>> dataetapas =
          await syncenfermedades.getEtapasEnfermedades();
      Map<String, List> map = {
        "enfermedades": dataenfermedades,
        "etapas": dataetapas
      };
      return map;
      // enfermedadesBloc.addEnfermedades(dataenfermedades, dataetapas);
    } catch (e) {
      print(e);
      return {};
    }
  }

  // insertarPlagas(Function callbackestado) async {
  //   try {
  //     callbackestado('Agregando plagas');
  //     PlagasBloc plagasBloc = PlagasBloc();

  //     List<Insertable<Plaga>> dataplagas = await syncplagas.getPlagas();
  //     List<Insertable<EtapasPlagaData>> etapasplagas =
  //         await syncplagas.getEtapasPlagas();

  //     plagasBloc.addPlagas(dataplagas, etapasplagas);
  //   } catch (e) {
  //     print("error plagas");
  //     print(e);
  //   }
  // }

  // insertarProductos(Function callbackestado) async {
  //   try {
  //     callbackestado('Agregando productos');
  //     ProductosBloc productosBloc = ProductosBloc();

  //     List<Insertable<ProductoAgroquimicoData>> dataproductos =
  //         await syncproductos.getProductos();

  //     productosBloc.addProductos(dataproductos);
  //   } catch (e) {
  //     print('error productos');
  //     print(e);
  //   }
  // }

}

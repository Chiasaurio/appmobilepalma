import 'package:apppalma/constants.dart';
import 'package:apppalma/moor/daos/palma_daos.dart';
import 'package:apppalma/moor/daos/producto_dao.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/registroenfermedad_table.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';

part 'tratamiento_state.dart';

class TratamientoCubit extends Cubit<TratamientoState> {
  TratamientoCubit() : super(TratamientoInitial());

  final db = getIt<AppDatabase>();

  Future<void> obtenerPalmasEnfermas(String nommbreLote) async {
    emit(TratamientoInitial());

    final PalmaDao palmaDao = db.palmaDao;
    List<PalmaConEnfermedad> palmas =
        await palmaDao.obtenerPalmasConEnfermedad(nommbreLote);

    emit(PalmasEnfermasLoaded(palmasEnfermas: palmas));
  }

  Future<void> obtenerProductos(PalmaConEnfermedad palma) async {
    final ProductoAgroquimicoDao productosDao = db.productoAgroquimicoDao;
    List<ProductoAgroquimicoData> productos = await productosDao.getProductos();
    emit(PalmaEnfermaEscogida(palmaEnferma: palma, productos: productos));
  }

  Future<bool> registrarTratamiento(
    int idregistroenfermedad,
    int idproductoagroquimico,
    Palma palma,
    String tipocontrol,
    double dosis,
    String descripcion,
    DateTime fecha,
  ) async {
    try {
      final PalmaDao palmaDao = db.palmaDao;
      final registrotratamiento = RegistroTratamientoCompanion(
        idRegistroEnfermedad: Value(idregistroenfermedad),
        idProductoAgroquimico: Value(idproductoagroquimico),
        descripcionProcedimiento: Value(descripcion),
        dosis: Value(dosis),
        tipoControl: Value(tipocontrol),
        fechaRegistro: Value(fecha),
      );
      final res = await palmaDao.insertarTratamiento(registrotratamiento);
      if (res) {
        const estadopalma = EstadosPalma.enTratamiento;
        actualizarPalma(palma, estadopalma);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('error en bloc $e');
      return false;
    }
  }

  actualizarPalma(Palma palma, String estadopalma) {
    final PalmaDao palmaDao = db.palmaDao;
    palmaDao.updatePalma(
        palma.copyWith(estadopalma: estadopalma, sincronizado: false));
  }
}

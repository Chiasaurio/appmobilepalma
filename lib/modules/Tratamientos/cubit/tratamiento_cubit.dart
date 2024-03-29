import 'package:apppalma/constants.dart';
import 'package:apppalma/moor/daos/palma_daos.dart';
import 'package:apppalma/moor/daos/producto_dao.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/registroenfermedad_table.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/toasts/toasts.dart';
import '../../../main.dart';

part 'tratamiento_state.dart';

class TratamientoCubit extends Cubit<TratamientoState> {
  TratamientoCubit() : super(const TratamientoState());

  final db = getIt<AppDatabase>();

  Future<void> obtenerPalmasEnfermas(String nommbreLote) async {
    emit(const TratamientoState(status: TratamientoStatus.loading));

    final PalmaDao palmaDao = db.palmaDao;
    List<PalmaConEnfermedad> palmas =
        await palmaDao.obtenerPalmasConEnfermedad(nommbreLote);

    emit(state.copyWith(
        palmasEnfermas: palmas, status: TratamientoStatus.loaded));
  }

  Future<void> obtenerProductos(PalmaConEnfermedad palma) async {
    emit(state.copyWith(status: TratamientoStatus.loading));
    final ProductoAgroquimicoDao productosDao = db.productoAgroquimicoDao;
    List<ProductoAgroquimicoData> productos = await productosDao.getProductos();
    emit(state.copyWith(
        palmaEnferma: palma,
        productos: productos,
        status: TratamientoStatus.selected));
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
        emit(state.copyWith(status: TratamientoStatus.success));
        registroExitosoToast();

        return true;
      } else {
        registroFallidoToast('Error al realizar el registro');
        return false;
      }
    } catch (e) {
      registroFallidoToast('Error al realizar el registro');
      return false;
    }
  }

  actualizarPalma(Palma palma, String estadopalma) {
    final PalmaDao palmaDao = db.palmaDao;
    palmaDao.updatePalma(
        palma.copyWith(estadopalma: estadopalma, sincronizado: false));
  }
}

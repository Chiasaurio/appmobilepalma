import 'package:apppalma/data/moor/daos/fumigacion_dao.dart';
import 'package:apppalma/data/moor/daos/producto_dao.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/main.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:apppalma/globals.dart' as globals;

import '../../../components/toasts/toasts.dart';

part 'fumigacion_state.dart';

class FumigacionCubit extends Cubit<FumigacionState> {
  FumigacionCubit() : super(const FumigacionState());
  final db = getIt<AppDatabase>();
  clear() {
    emit(const FumigacionState());
  }

  Future<void> obtenerProductos(CensoData censo) async {
    final ProductoAgroquimicoDao productosDao = db.productoAgroquimicoDao;
    List<ProductoAgroquimicoData> productos = await productosDao.getProductos();
    emit(state.copyWith(
        censo: censo, productos: productos, productosLoaded: true));
  }

  registrarAplicacion(
      DateTime fechaaplicacion,
      DateTime fechareingreso,
      double dosis,
      String unidades,
      CensoData censo,
      int idProductoAgroquimico,
      int area) async {
    try {
      final FumigacionDao fumigacionDao = db.fumigacionDao;
      final registrofumigacion = AplicacionesCompanion(
        fechaAplicacion: Value(fechaaplicacion),
        fechaReingreso: Value(fechareingreso),
        dosis: Value(dosis),
        unidades: Value(unidades),
        idCenso: Value(censo.idCenso ?? censo.id),
        idProductoAgroquimico: Value(idProductoAgroquimico),
        area: Value(area),
        responsable: Value(globals.responsable),
      );
      await fumigacionDao.insertarAplicacion(registrofumigacion, censo);
      emit(state.copyWith(status: FormStatus.submissionSuccess));
      registroExitosoToast();
    } catch (e) {
      emit(state.copyWith(status: FormStatus.submissionFailure));
      registroFallidoToast('$e');
      throw Error();
    }
  }
}

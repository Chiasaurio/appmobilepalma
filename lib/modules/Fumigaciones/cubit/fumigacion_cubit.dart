import 'package:apppalma/data/moor/daos/fumigacion_dao.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/utils/form_status.dart';
import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as secure;
import 'package:equatable/equatable.dart';

import '../../../components/toasts/toasts.dart';
import '../../../data/moor/daos/producto_dao.dart';
import '../../../main.dart';

part 'fumigacion_state.dart';

class FumigacionCubit extends Cubit<FumigacionState> {
  FumigacionCubit() : super(const FumigacionState());
  final db = getIt<AppDatabase>();
  static const _storage = secure.FlutterSecureStorage();

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
      CensoData censo,
      int idProductoAgroquimico,
      int area) async {
    try {
      final ccUsuario = await _storage.read(key: 'cc_usuario');

      final FumigacionDao fumigacionDao = db.fumigacionDao;
      final registrofumigacion = AplicacionesCompanion(
        fechaAplicacion: Value(fechaaplicacion),
        fechaReingreso: Value(fechareingreso),
        dosis: Value(dosis),
        idCenso: Value(censo.idCenso),
        idProductoAgroquimico: Value(idProductoAgroquimico),
        area: Value(area),
        ccUsuario: Value(ccUsuario!),
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

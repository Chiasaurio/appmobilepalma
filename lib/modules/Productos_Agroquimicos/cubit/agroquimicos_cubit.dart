import 'package:apppalma/main.dart';
import 'package:apppalma/moor/daos/producto_dao.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';

part 'agroquimicos_state.dart';

class AgroquimicosCubit extends Cubit<AgroquimicosState> {
  AgroquimicosCubit() : super(AgroquimicosInitial());
  final db = getIt<AppDatabase>();

  Future<List<ProductoAgroquimicoData>> obtenerTodosProductos() async {
    final ProductoAgroquimicoDao productoAgroquimicoDao =
        db.productoAgroquimicoDao;
    List<ProductoAgroquimicoData> productos =
        await productoAgroquimicoDao.getProductos();
    return productos;
  }

  addProductosFromServerToLocal(Map<String, List> map) async {
    List<Insertable<ProductoAgroquimicoData>> productos =
        map["productos"] as List<Insertable<ProductoAgroquimicoData>>;
    final ProductoAgroquimicoDao productoAgroquimicoDao =
        db.productoAgroquimicoDao;
    await productoAgroquimicoDao.insertProductos(productos);
  }
}

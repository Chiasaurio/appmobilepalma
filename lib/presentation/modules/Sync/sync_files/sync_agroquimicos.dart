import 'package:apppalma/data/api.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';

import '../../../../main.dart';

class SyncFromServerDataAgroquimicos {
  final List<Insertable<ProductoAgroquimicoData>> serverProducts;

  SyncFromServerDataAgroquimicos({required this.serverProducts});
}

class SyncProductosAgroquimicos {
  final Api _apiInstance = Api.getInstance();
  final db = getIt<AppDatabase>();

  Future<List<Insertable<ProductoAgroquimicoData>>> getProductos() async {
    try {
      final fechaHoy = DateTime.now();
      List dataproductos;
      final resp = await _apiInstance.get('agroquimicoTodas');
      dataproductos = resp['data'];
      List<Insertable<ProductoAgroquimicoData>> productos = [];
      List<int> idsFromServer = [];
      for (var element in dataproductos) {
        idsFromServer.add(element['id_producto_agroquimico']);
        ProductoAgroquimicoCompanion aux = ProductoAgroquimicoCompanion(
            idProductoAgroquimico: Value(element['id_producto_agroquimico']),
            nombreProductoAgroquimico:
                Value(element['nombre_producto_agroquimico']),
            ingredienteActivoProductoAgroquimico:
                Value(element['ingrediente_activo_producto_agroquimico']),
            periodoCarenciaProductoAgroquimico:
                Value(element['periodo_carencia_producto_agroquimico']),
            presentacionProductoAgroquimico:
                Value(element['presentacion_producto_agroquimico']),
            tipoProductoAgroquimico:
                Value(element['tipo_producto_agroquimico']),
            claseProducto: Value(element['clase_producto']),
            fechaUltimaActualizacion: Value(fechaHoy));
        productos.add(aux);
      }

      return productos;
    } catch (e) {
      return [];
    }
  }
}

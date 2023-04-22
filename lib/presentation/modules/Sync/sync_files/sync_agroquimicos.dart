import 'package:apppalma/data/api.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';

class SyncProductosAgroquimicos {
  final Api _apiInstance = Api.getInstance();

  Future<List<Insertable<ProductoAgroquimicoData>>> getProductos() async {
    try {
      List dataproductos;
      final resp = await _apiInstance.get('agroquimicoTodas');
      dataproductos = resp['data'];
      List<Insertable<ProductoAgroquimicoData>> productos = [];
      for (var element in dataproductos) {
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
          tipoProductoAgroquimico: Value(element['tipo_producto_agroquimico']),
          claseProducto: Value(element['clase_producto']),
        );
        productos.add(aux);
      }
      return productos;
    } catch (e) {
      return [];
    }
  }
}

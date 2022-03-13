import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/productoagroquimico_table.dart';
import 'package:drift/drift.dart';

part 'producto_dao.g.dart';

@DriftAccessor(tables: [ProductoAgroquimico])
class ProductoAgroquimicoDao extends DatabaseAccessor<AppDatabase>
    with _$ProductoAgroquimicoDaoMixin {
  final AppDatabase db;
  ProductoAgroquimicoDao(this.db) : super(db);

  Future<List<ProductoAgroquimicoData>> getProductos() {
    return (select(productoAgroquimico)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.nombreProductoAgroquimico)]))
        .get();
  }

  Future insertProducto(Insertable<ProductoAgroquimicoData> producto) =>
      into(productoAgroquimico).insert(producto);

  insertProductos(
      List<Insertable<ProductoAgroquimicoData>> listaproductos) async {
    try {
      await batch((b) {
        for (final producto in listaproductos) {
          b.insert(
            productoAgroquimico,
            producto,
            onConflict: DoUpdate(
              (_) => producto,
              // upsert will happen if it conflicts with columnA and columnB
              target: [productoAgroquimico.idProductoAgroquimico],
            ),
          );
        }
      });
    } catch (e) {
      print(e);
    }
  }
}

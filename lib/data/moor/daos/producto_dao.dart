import 'package:apppalma/data/moor/moor_database.dart';
import '../tables/tables.dart';
import 'package:drift/drift.dart';

part 'producto_dao.g.dart';

@DriftAccessor(tables: [ProductoAgroquimico])
class ProductoAgroquimicoDao extends DatabaseAccessor<AppDatabase>
    with _$ProductoAgroquimicoDaoMixin {
  final AppDatabase db;
  ProductoAgroquimicoDao(this.db) : super(db);

  Future<List<ProductoAgroquimicoData>> getProductos() {
    return (select(productoAgroquimico)).get();
  }

  Future insertProducto(Insertable<ProductoAgroquimicoData> producto) =>
      into(productoAgroquimico).insert(producto);

  Future<ProductoAgroquimicoData?> getProductoAgroquimicoUltimo() async {
    final query = (select(productoAgroquimico));
    query.orderBy([(tbl) => OrderingTerm.desc(tbl.fechaUltimaActualizacion)]);

    final res = await query.get();

    return res[0];
  }

  insertProductos(
      List<Insertable<ProductoAgroquimicoData>> listaproductos) async {
    try {
      await batch((b) {
        b.insertAllOnConflictUpdate(productoAgroquimico, listaproductos);
        // for (final producto in listaproductos) {
        //   b.insert(
        //     productoAgroquimico,
        //     producto,
        //     onConflict: DoUpdate(
        //       (_) => producto,
        //       // upsert will happen if it conflicts with columnA and columnB
        //       target: [productoAgroquimico.idProductoAgroquimico],
        //     ),
        //   );
        // }
      });
    } catch (_) {}
  }
}

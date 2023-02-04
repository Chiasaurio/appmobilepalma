import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/aplicaciones_table.dart';
import 'package:apppalma/moor/tables/censo_table.dart';
import 'package:drift/drift.dart';

part 'fumigacion_dao.g.dart';

@DriftAccessor(tables: [Censo, Aplicaciones])
class FumigacionDao extends DatabaseAccessor<AppDatabase>
    with _$FumigacionDaoMixin {
  final AppDatabase db;
  FumigacionDao(this.db) : super(db);

  Future insertarAplicacion(
      Insertable<Aplicacione> aplicacion, CensoData censo) async {
    try {
      return transaction(() async {
        await into(aplicaciones).insert(aplicacion);
        await updateCenso(
            censo.copyWith(estadoPlaga: 'fumigado', sincronizado: false));
      });
    } catch (_) {}
  }

  Future<List<Aplicacione>> obtenerTodasAplicaciones() {
    return (select(aplicaciones)).get();
  }

  Future updateCenso(Insertable<CensoData> censoobjeto) =>
      update(censo).replace(censoobjeto);
}

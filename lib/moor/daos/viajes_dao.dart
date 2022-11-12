import 'package:apppalma/moor/moor_database.dart';
import 'package:apppalma/moor/tables/viajes_table.dart';
import 'package:drift/drift.dart';

part 'viajes_dao.g.dart';

@DriftAccessor(tables: [Viajes])
class ViajesDao extends DatabaseAccessor<AppDatabase> with _$ViajesDaoMixin {
  final AppDatabase db;
  ViajesDao(this.db) : super(db);

  Future<List<Viaje>> getViajes() {
    return (select(viajes)).get();
  }

  Future<int> insertViaje(Insertable<Viaje> viaje) =>
      into(viajes).insert(viaje);
  Future updateViaje(Insertable<Viaje> viaje) => update(viajes).replace(viaje);
}

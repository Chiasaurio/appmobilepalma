import 'package:apppalma/data/moor/moor_database.dart';
import '../tables/tables.dart';
import 'package:drift/drift.dart';

part 'viajes_dao.g.dart';

@DriftAccessor(tables: [Viajes])
class ViajesDao extends DatabaseAccessor<AppDatabase> with _$ViajesDaoMixin {
  final AppDatabase db;
  ViajesDao(this.db) : super(db);

  Future<List<Viaje>> getViajes() {
    return (select(viajes)).get();
  }

  Future<List<Viaje>> getRegistrosForSync() {
    return (select(viajes)..where((c) => c.sincronizado.equals(false))).get();
  }

  Future updateSyncViaje(Viaje viaje) {
    return (update(viajes)..where((t) => t.id.equals(viaje.id))).write(
      const ViajesCompanion(
        sincronizado: Value(true),
      ),
    );
  }

  Future<int> insertViaje(Insertable<Viaje> viaje) =>
      into(viajes).insert(viaje);
  Future updateViaje(Viaje viaje) =>
      update(viajes).replace(viaje.copyWith(sincronizado: false));
}

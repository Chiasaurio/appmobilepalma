import 'package:apppalma/data/api.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';

class SyncFertilizantes {
  final Api _apiInstance = Api.getInstance();

  Future<List<Insertable<FertilizanteData>>> getFertilizantes() async {
    try {
      final fechaHoy = DateTime.now();
      List datafertlizantes;
      final resp = await _apiInstance.get('fertilizantesTodos');
      datafertlizantes = resp['data'];
      List<Insertable<FertilizanteData>> productos = [];
      for (var element in datafertlizantes) {
        FertilizanteCompanion aux = FertilizanteCompanion(
            idFertilizante: Value(element['id']),
            nombreFertilizante: Value(element['nombre_fertilizante']),
            tipo: Value(element['tipo']),
            composicion: Value(element['composicion']),
            porcentaje: Value(element['porcentaje']),
            presentacionPnombreFertilizante:
                Value(element['presentacion_nombre_fertilizante'] ?? 'normal'),
            fechaUltimaActualizacion: Value(fechaHoy));
        productos.add(aux);
      }
      return productos;
    } catch (e) {
      return [];
    }
  }
}

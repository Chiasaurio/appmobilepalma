import 'package:apppalma/data/api.dart';
import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/presentation/components/toasts/toasts.dart';
import 'package:drift/drift.dart';

class SyncLotes {
  final Api _apiInstance = Api.getInstance();

  Future<List<Insertable<Lote>>> getLotesRemoteSource() async {
    try {
      final fechaHoy = DateTime.now();
      List datalotes = [];
      final resp = await _apiInstance.get('lote');
      datalotes = resp['data'];
      List<Insertable<Lote>> lotes = [];
      for (var element in datalotes) {
        LotesCompanion aux = LotesCompanion(
          nombreLote: Value(element['nombre_lote']),
          hectareas: Value(element['hectareas']),
          numeropalmas: Value(element['numero_palmas']),
          fechaUltimaActualizacion: Value(fechaHoy),
          numeroLineas: Value(element['numero_lineas']),
          palmasPorLinea: Value(element['palmas_por_linea']),
        );
        lotes.add(aux);
      }
      return lotes;
    } catch (e) {
      registroFallidoToast('Error al realizar el registro : ${e.toString()}');
      return [];
    }
  }
}

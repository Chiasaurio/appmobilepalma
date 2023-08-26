import 'package:apppalma/data/moor/moor_database.dart';
import 'package:image_picker/image_picker.dart';
import '../tables/tables.dart';
import 'package:drift/drift.dart';

part 'registroenfermedad_dao.g.dart';

@DriftAccessor(tables: [RegistroEnfermedad, ImagenRegistroEnfermedad])
class RegistroEnfermedadDao extends DatabaseAccessor<AppDatabase>
    with _$RegistroEnfermedadDaoMixin {
  RegistroEnfermedadDao(AppDatabase db) : super(db);

  Future updateRegistro(Insertable<RegistroEnfermedadData> registro) =>
      update(registroEnfermedad).replace(registro);

  Future<RegistroEnfermedadData?> getRegistroEnfermedad(int id) {
    return (select(registroEnfermedad)..where((r) => r.id.equals(id)))
        .getSingleOrNull();
  }

  Future<void> insertRegistroEnfermedad(
      Insertable<RegistroEnfermedadData> e, List<XFile> imagenes) async {
    try {
      return transaction(() async {
        var id = await into(registroEnfermedad).insert(e);
        //Se obtienen los objetos de las imagenes para insertar;
        List<Insertable<ImagenRegistroEnfermedadData>> imagenesCompanions =
            await getImagenesRegistroEnfermedadCompanion(id, imagenes);
        await batch((batch) {
          batch.insertAll(imagenRegistroEnfermedad, imagenesCompanions);
        });
      });
    } catch (_) {}
  }

  Future updateSyncRegistro(
      RegistroEnfermedadData e, List<ImagenRegistroEnfermedadData> imagenes) {
    return transaction(() async {
      await (update(registroEnfermedad)..where((t) => t.id.equals(e.id))).write(
        const RegistroEnfermedadCompanion(
          sincronizado: Value(true),
        ),
      );
      for (var element in imagenes) {
        await (update(imagenRegistroEnfermedad)
              ..where((c) => c.idImagenRegistroEnfermedad
                  .equals(element.idImagenRegistroEnfermedad)))
            .write(const ImagenRegistroEnfermedadCompanion(
          sincronizado: Value(true),
        ));
      }
    });
  }

  Future<List<Insertable<ImagenRegistroEnfermedadData>>>
      getImagenesRegistroEnfermedadCompanion(
          int idEnfermedad, List<XFile> imagenes) async {
    List<Insertable<ImagenRegistroEnfermedadData>> imagenesCompanions = [];
    for (var e in imagenes) {
      Uint8List imageBytes = await e.readAsBytes();
      ImagenRegistroEnfermedadCompanion aux = ImagenRegistroEnfermedadCompanion(
        idEnfermedad: Value(idEnfermedad),
        imagen: Value(imageBytes),
      );
      imagenesCompanions.add(aux);
    }
    return imagenesCompanions;
  }
}

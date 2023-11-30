import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/data/moor/tables/tables.dart';
import 'package:drift/drift.dart';

class RegistroEnfermedad extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idRegistroEnfermedad => integer().nullable()();
  DateTimeColumn get fechaRegistro => dateTime()();
  DateTimeColumn get horaRegistro => dateTime().nullable()();
  TextColumn get idPalma => text().references(Palmas, #identificador)();
  TextColumn get nombreEnfermedad =>
      text().references(Enfermedades, #nombreEnfermedad)();
  IntColumn get idEtapaEnfermedad =>
      integer().nullable().references(Etapas, #id)();
  TextColumn get observaciones => text().nullable()();
  TextColumn get responsable => text().references(Usuario, #ccUsuario)();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
  BoolColumn get dadaDeAlta => boolean().withDefault(const Constant(false))();
}

class ImagenRegistroEnfermedad extends Table {
  IntColumn get idImagenRegistroEnfermedad => integer().autoIncrement()();
  IntColumn get idEnfermedad => integer().references(RegistroEnfermedad, #id)();
  BlobColumn get imagen => blob()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();
}

class RegistroEnfermedadConImagenes {
  final RegistroEnfermedadData registroEnfermedad;
  final List<ImagenRegistroEnfermedadData> imagenes;

  RegistroEnfermedadConImagenes({
    required this.imagenes,
    required this.registroEnfermedad,
  });
}

class PalmaConEnfermedad {
  final Palma palma;
  final RegistroEnfermedadData registroEnfermedad;
  final Enfermedade enfermedad;
  final Etapa? etapa;

  PalmaConEnfermedad({
    required this.palma,
    required this.registroEnfermedad,
    required this.enfermedad,
    this.etapa,
  });
}

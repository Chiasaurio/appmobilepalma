import 'package:apppalma/data/moor/moor_database.dart';
import 'package:drift/drift.dart';

class RegistroEnfermedad extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idRegistroEnfermedad => integer().nullable()();
  DateTimeColumn get fechaRegistro => dateTime()();
  DateTimeColumn get horaRegistro => dateTime().nullable()();
  TextColumn get idPalma => text()();
  TextColumn get nombreEnfermedad => text()();
  IntColumn get idEtapaEnfermedad => integer().nullable()();
  TextColumn get observaciones => text().nullable()();
  TextColumn get responsable => text()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(id_palma) REFERENCES palmas(identificador)',
        'FOREIGN KEY(nombre_enfermedad) REFERENCES enfermedades(nombre_enfermedad)',
        'FOREIGN KEY(id_etapa_enfermedad) REFERENCES etapas(id)',
        'FOREIGN KEY(responsable) REFERENCES usuario(cc_usuario)',
      ];
}

class ImagenRegistroEnfermedad extends Table {
  IntColumn get idImagenRegistroEnfermedad => integer().autoIncrement()();
  IntColumn get idEnfermedad => integer()();
  BlobColumn get imagen => blob()();
  BoolColumn get sincronizado => boolean().withDefault(const Constant(false))();

  @override
  List<String> get customConstraints => [
        'FOREIGN KEY(id_enfermedad) REFERENCES registro_enfermedad(id)',
      ];
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

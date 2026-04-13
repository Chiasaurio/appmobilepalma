import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/presentation/modules/Enfermedad/cubit/enfermedad_cubit.dart';
import 'package:apppalma/presentation/modules/Plagas/cubit/plagas_cubit.dart';
import 'package:apppalma/presentation/modules/Plagas/models/etapa_individuo_model.dart';
import 'package:apppalma/presentation/modules/Productos_Agroquimicos/cubit/agroquimicos_cubit.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';

import '../../helpers/seed_data.dart';
import '../../helpers/test_database.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = ensureTestDatabase();
  });

  test('AgroquimicosCubit loads and appends agrochemical products', () async {
    await seedCoreGraph(db);
    final cubit = AgroquimicosCubit();

    final productos = await cubit.obtenerTodosProductos();
    expect(productos.any((p) => p.nombreProductoAgroquimico == 'Producto A'),
        isTrue);

    await cubit.addProductosFromServerToLocal({
      'productos': <Insertable<ProductoAgroquimicoData>>[
        ProductoAgroquimicoCompanion(
          idProductoAgroquimico: const Value(2),
          nombreProductoAgroquimico: const Value('Producto B'),
          tipoProductoAgroquimico: const Value('Tipo'),
          claseProducto: const Value('Clase'),
          ingredienteActivoProductoAgroquimico: const Value('Ingrediente'),
          periodoCarenciaProductoAgroquimico: const Value(9),
          presentacionProductoAgroquimico: const Value('Litro'),
          fechaUltimaActualizacion: Value(DateTime(2024, 1, 9, 12)),
        ),
      ],
    });

    final updated = await cubit.obtenerTodosProductos();
    expect(updated.any((p) => p.nombreProductoAgroquimico == 'Producto B'),
        isTrue);
  });

  test('PlagasCubit loads plagas and inserts a censo record', () async {
    await seedCoreGraph(db);
    final cubit = PlagasCubit();
    await cubit.obtenerTodasPlagasConEtapas();
    expect(cubit.state.plagas, isNotEmpty);

    final plaga = cubit.state.plagas!.first;
    cubit.changePlaga(plaga);
    cubit.changeLinea(1);
    cubit.changeNumero(1);
    cubit.changeOrientacion('N');
    cubit.changeNumeroIndividuos(5);
    cubit.changeObservaciones('Observacion de prueba');
    cubit.changeImagenes(const <XFile>[]);
    cubit.changeEtapa([
      EtapaIndividuosModel(etapa: plaga.etapas.first, individuos: 3),
    ]);

    await cubit.addPlagayEtapasFromServerToLocal({
      'plagas': <Insertable<Plaga>>[
        PlagasCompanion(
          nombreComunPlaga: const Value('Plaga C'),
          fechaUltimaActualizacion: Value(DateTime(2024, 1, 10, 12)),
        ),
      ],
      'etapas': <Insertable<EtapasPlagaData>>[
        EtapasPlagaCompanion(
          nombrePlaga: const Value('Plaga C'),
          nombreEtapa: const Value('Etapa 1'),
          procedimientoEtapa: const Value('Procedimiento'),
        ),
      ],
    });

    final plagas = await db.plagasDao.obtenerPlagaConEtapas();
    expect(plagas.any((item) => item.plaga.nombreComunPlaga == 'Plaga C'),
        isTrue);
  });

  test('EnfermedadCubit registers illnesses and discharges them', () async {
    await seedCoreGraph(db);
    final cubit = EnfermedadCubit();

    cubit.initCubit('Lote A');
    await cubit.changeLinea(1);
    await cubit.changeNumero(1);
    cubit.changeOrientacion('N');
    cubit.changeObservaciones('Observacion');
    await cubit.obtenerTodasEnfermedadesConEtapas();
    expect(cubit.state.enfermedades, isNotEmpty);

    final enfermedad = cubit.state.enfermedades!.first.enfermedad;
    final etapa = cubit.state.enfermedades!.first.etapas.first;
    await cubit.enfermedadChange(enfermedad);
    await cubit.etapaChanged(etapa);
    cubit.changeImagenes(const <XFile>[]);

    final palma = await db.palmaDao.obtenerPalmas('Lote A').then(
          (value) => value.first,
        );
    final registro = await db.palmaDao.obtenerRegistrosEnfermedad().then(
          (value) => value.first,
        );
    final alta = await cubit.darDeAltaEnfermedad(
      palma: palma!,
      registroEnfermedad: registro,
    );
    expect(alta, isTrue);
  });
}

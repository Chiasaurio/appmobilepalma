import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/main.dart' as app_main;
import 'package:apppalma/presentation/modules/LoteDetail/cubit/lote_detail_cubit.dart';
import 'package:apppalma/presentation/modules/LotesList/cubit/loteslist_cubit.dart';
import 'package:apppalma/utils/recargar_lote_detail.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeLoteslistCubit extends LoteslistCubit {
  int calls = 0;

  @override
  Future<void> obtenerTodosLotesWithProcesos() async {
    calls++;
  }
}

class _FakeLoteDetailCubit extends LoteDetailCubit {
  int calls = 0;

  @override
  Future<void> reloadLote(int idlote) async {
    calls++;
  }
}

void main() {
  setUpAll(() {
    if (!app_main.getIt.isRegistered<AppDatabase>()) {
      app_main.getIt.registerSingleton<AppDatabase>(
        AppDatabase(NativeDatabase.memory()),
        signalsReady: true,
      );
    }
  });

  testWidgets('recargarLote refreshes the lot list only', (tester) async {
    final lotesCubit = _FakeLoteslistCubit();
    final detailCubit = _FakeLoteDetailCubit();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MultiBlocProvider(
            providers: [
              BlocProvider<LoteslistCubit>.value(value: lotesCubit),
              BlocProvider<LoteDetailCubit>.value(value: detailCubit),
            ],
            child: Builder(
              builder: (context) {
                return TextButton(
                  onPressed: () => recargarLote(context),
                  child: const Text('Refresh lot'),
                );
              },
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.widgetWithText(TextButton, 'Refresh lot'));
    await tester.pump();

    expect(lotesCubit.calls, 1);
    expect(detailCubit.calls, 0);
  });
}

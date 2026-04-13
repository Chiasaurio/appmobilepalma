import 'package:apppalma/data/moor/moor_database.dart';
import 'package:apppalma/main.dart' as app_main;
import 'package:drift/native.dart';

AppDatabase ensureTestDatabase() {
  if (app_main.getIt.isRegistered<AppDatabase>()) {
    return app_main.getIt<AppDatabase>();
  }

  final db = AppDatabase(NativeDatabase.memory());
  app_main.getIt.registerSingleton<AppDatabase>(db, signalsReady: true);
  return db;
}

import 'package:apppalma/app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'data/moor/moor_database.dart';

void main() {
  setup();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const AppPalma());
}

GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AppDatabase>(AppDatabase(), signalsReady: true);
}

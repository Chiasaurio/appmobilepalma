import 'package:apppalma/app.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  setup();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(AppPalma());
}

GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AppDatabase>(AppDatabase(), signalsReady: true);
}

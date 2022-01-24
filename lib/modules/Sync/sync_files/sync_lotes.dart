import 'dart:convert';

import 'package:apppalma/api.dart';
import 'package:apppalma/moor/moor_database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SyncLotes {
  final Api _apiInstance = Api.getInstance();

  Future<List<Insertable<Lote>>> getLotesRemoteSource() async {
    List datalotes = [];
    final resp = await _apiInstance.get('lote');
    datalotes = resp['data'];
    List<Insertable<Lote>> lotes = [];
    datalotes.forEach((element) {
      LotesCompanion aux = LotesCompanion(
        nombreLote: Value(element['nombre_lote']),
        hectareas: Value(0),
        numeropalmas: Value(1000),
      );
      lotes.add(aux);
    });
    return lotes;
  }
}

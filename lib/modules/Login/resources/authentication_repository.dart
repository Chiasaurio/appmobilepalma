import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as secure;

import '../../../env.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, error }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final _storage = const secure.FlutterSecureStorage();
  final _baseUrl = baseUrl;
  final Dio _dio = Dio();
  Map<String, String> cookies = {};

  static final _instance = AuthenticationRepository._internal();

  factory AuthenticationRepository() {
    return _instance;
  }

  AuthenticationRepository._internal();

  /// Es un stream que se actualiza cuando un usuario se authentica o cierra
  /// sesión.
  /// Returns. Stream
  Stream<AuthenticationStatus> get status async* {
    yield* _controller.stream;
  }

  /// Realiza la autenticación con el backend y retorna el estatus de la
  /// respuesta
  Future<int> logIn(String ccUsuario, String password) async {
    try {
      final body =
          jsonEncode({'cc_usuario': ccUsuario, 'contrasena_usuario': password});
      final res = await _dio.post('${_baseUrl}login',
          data: body,
          options: Options(
              headers: {HttpHeaders.contentTypeHeader: 'application/json'},
              responseType: ResponseType.json));

      final respDecode = res.data;
      if (res.statusCode == 200) {
        await setUserCredentials(
            respDecode['token'], ccUsuario, password, password);
        _controller.add(AuthenticationStatus.authenticated);
      }
      return res.statusCode!;
    } on Exception catch (_) {
      return 401;
    }
  }

  /// Borra la informacion del usuario en el dispositivo
  Future<void> logOut() async {
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'cc_usuario');
    await _storage.delete(key: 'password');
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  /// Guarda el token y el id del usuario enviados por el backend
  Future<void> setUserCredentials(
      String jwt, String ccUsuario, String password, String spToken
      // String userId,
      ) async {
    await _storage.write(key: 'token', value: jwt);
    await _storage.write(key: 'cc_usuario', value: ccUsuario);
    await _storage.write(key: 'password', value: password);
  }

  Future<Map<String, String>> getUserCredentials() async {
    final email = await _storage.read(key: 'cc_usuario');
    final password = await _storage.read(key: 'password');
    return {"cc_usuario": email!, "password": password!};
  }

  /// Obtiene el token guardado en el dispositivo
  /// Returns. Future string.
  Future<String> get jwt async {
    final jwt = await _storage.read(key: 'token');
    if (jwt == null) return '';
    return jwt;
  }
}

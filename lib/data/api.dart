import 'dart:io';
import 'dart:convert';
import 'package:apppalma/presentation/modules/Login/resources/authentication_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as secure;
import 'package:dio/dio.dart';

import '../env.dart';

class Api {
  final _storage = const secure.FlutterSecureStorage();
  final _baseUrl = baseUrl;
  static final Dio _dio = Dio();
  final Map<String, String> _headers = {};
  static final Api _instance = Api._();
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  /// Constructor privado de la Api
  Api._();

  /// Retorna una instancia de API
  static Api getInstance() => _instance;

  /// Le agrega los Headers a la peticion al backend
  Future<void> setHeaders() async {
    _headers[HttpHeaders.contentTypeHeader] = 'application/json';
    _headers[HttpHeaders.acceptHeader] = 'application/json';
    var jwt = await _storage.read(key: 'token');
    var auth = 'Bearer $jwt';
    if (jwt != null) {
      _headers[HttpHeaders.authorizationHeader] = auth;
    }
  }

  /// Parsea un json en formato string a un Map
  /// Returns. Map String, dynamic
  Map<String, dynamic> decode(String response) => jsonDecode(response);

  /// Encode un json en formato Map a un String
  /// Returns. Map String, dynamic
  String encode(Map<String, dynamic> response) => jsonEncode(response);

  /// Hace peticiones get con la subruta pasada por parametro
  /// Returns Future con un Map de la respuesta
  Future<Map<String, dynamic>> get(String path) async {
    try {
      await setHeaders();
      Map<String, dynamic> resp = {};
      _dio.interceptors.add(
        InterceptorsWrapper(
          onError: (e, handler) {
            if (e.response?.statusCode == 401) {
              _authenticationRepository.logOut();
            }
            if (e.response?.statusCode == 403) {
              _authenticationRepository.logOut();
            }
          },
        ),
      );
      final response = await _dio.get('$_baseUrl$path',
          options: Options(headers: _headers, responseType: ResponseType.json));
      resp['data'] = response.data;
      return resp;
    } on DioError catch (_) {
      return {'success': false};
    }
  }

  /// Hace peticiones post con la subruta pasada por parametro y la
  /// data que es enviada en el body del request
  /// Returns Future con un Map de la respuesta
  Future<Map<String, dynamic>> post(String path,
      {required Map<String, dynamic> data}) async {
    await setHeaders();
    final body = encode(data);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          if (e.response?.statusCode == 401) {
            _authenticationRepository.logOut();
          }
          if (e.response?.statusCode == 403) {
            _authenticationRepository.logOut();
          }
        },
      ),
    );
    final response = await _dio.post('$_baseUrl$path',
        data: body,
        options: Options(headers: _headers, responseType: ResponseType.json));
    return response.data;
  }

  /// Hace peticiones put con la subruta pasada por parametro y la
  /// data que es enviada en el body del request
  /// Returns Future con un Map de la respuesta
  Future<Map<String, dynamic>> put(String path,
      {Object data = const {}}) async {
    await setHeaders();
    final body = jsonEncode(data);
    final response = await _dio.put('$_baseUrl$path',
        data: body,
        options: Options(headers: _headers, responseType: ResponseType.json));
    return response.data;
  }

  /// Hace peticiones delte con la subruta pasada por parametro
  /// Returns Future con un Map de la respuesta
  Future<Response> delete(String path) async {
    await setHeaders();
    final response = await _dio.delete('$_baseUrl$path',
        options: Options(headers: _headers, responseType: ResponseType.json));
    return response;
  }
}

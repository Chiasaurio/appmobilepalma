import 'dart:io';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as secure;
import 'package:dio/dio.dart';

class Api {
  static final _storage = secure.FlutterSecureStorage();
  final _baseUrl = 'http://10.0.2.2:3000/';
  // final _baseUrl = 'http://192.168.42.173:3000/';
  final token =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOnsiY2NfdXN1YXJpbyI6IjEwOTg3NjU0MzIiLCJyb2wiOiJhZG1pbiJ9LCJpYXQiOjE2NDMzMzIzOTgsIm5iZiI6MTY0MzMzMjM5OCwiZXhwIjoxNjQzNDE4Nzk4fQ.PABkr9iP_zZd5vAITeXQyt1ZY5Tzoy9f4tmEigogkiPC5rEUUrh8_nRSYGfNR5q8LV-QtDUTJnGRRjHSdatHvMgqJnGUkQxzDmjSq7iQ8SGlPxPoidYRTGgNgCNRd7k1FKBtJDjMl_akmsIGOnFnQnayytMJyMnLBZGLdjjjD54";
  static final Dio _dio = Dio();
  static final Map<String, String> _headers = Map();
  static final Api _instance = Api._();

  /// Constructor privado de la Api
  Api._();

  /// Retorna una instancia de API
  static Api getInstance() => _instance;

  /// Le agrega los Headers a la peticion al backend
  Future<void> setHeaders() async {
    _headers[HttpHeaders.contentTypeHeader] = 'application/json';
    _headers[HttpHeaders.acceptHeader] = 'application/json';
    var jwt = await _storage.read(key: 'token');
    jwt = token;
    final username = await _storage.read(key: 'username');
    final password = await _storage.read(key: 'password');
    // var auth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var auth = 'Bearer $token';
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
      Map<String, dynamic> resp = new Map();
      print('$_baseUrl$path');
      final response = await _dio.get('$_baseUrl$path',
          options: Options(headers: _headers, responseType: ResponseType.json));
      resp['data'] = response.data;
      return resp;
    } on DioError catch (e) {
      return {'success': false};
    }
  }

  //second get without contentTypeHeader
  Future<Map<String, dynamic>> getModified(String path) async {
    try {
      await setHeaders();
      Map<String, dynamic> resp = new Map();
      print('$_baseUrl$path');
      _headers.remove(HttpHeaders.contentTypeHeader);
      final response = await _dio.get('$_baseUrl$path',
          options: Options(headers: _headers, responseType: ResponseType.json));
      resp['data'] = response.data;
      return resp;
    } on DioError catch (e) {
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

  // Future<String> uploadPhoto(XFile photo) async {
  //   String fileName = photo.path.split('/').last;
  //   FormData formData = FormData.fromMap({
  //     "file": await MultipartFile.fromFile(photo.path, filename: fileName),
  //   });
  //   await setHeaders();
  //   final response = await _dio.post('$_baseUrl' + 'photo_uploads.json',
  //       data: formData,
  //       options: Options(headers: _headers, responseType: ResponseType.json));
  //   return response.data["photo_upload"]["photo"]["url"];
  // }
}

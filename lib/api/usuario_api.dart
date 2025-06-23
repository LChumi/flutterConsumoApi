import 'package:app_chumi/api/api_constats.dart';
import 'package:app_chumi/models/Usuario.dart';
import 'package:app_chumi/models/UsuarioRequest.dart';
import 'package:dio/dio.dart';

class UsuarioApi {
  final Dio _dio;

  UsuarioApi(this._dio);

  String baseUrl = ApiConstants.apiUrl;

  Future<Usuario> login(UsuarioRequest request) async {
    String loginUrl = '$baseUrl/assist/login';
    try {
      final response = await _dio.post(
          loginUrl,
        data: request.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          }
        )
      );
      
      if (response.statusCode == 202) {
        final data = response.data;
        final usuario = Usuario.fromJson(data);
        return usuario;
      } else {
        throw Exception('Login fallido: código ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al iniciar sesión: $e');
    }
  }
}

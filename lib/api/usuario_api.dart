import 'package:app_chumi/api/api_constats.dart';
import 'package:app_chumi/models/UsuarioModel.dart';
import 'package:dio/dio.dart';

class UsuarioApi {
  final Dio _dio;

  UsuarioApi(this._dio);

  String baseUrl = ApiConstants.apiUrl;

  Future<UsuarioModel> login(String username, String password) async {
    String loginUrl = '$baseUrl/assist/login$username/$password';
    try {
      final response = await _dio.get(loginUrl);
      
      if (response.statusCode == 202) {
        final data = response.data;
        final usuario = UsuarioModel.fromJson(data);
        return usuario;
      } else {
        throw Exception('Failed to loguin');
      }
    } catch (e) {
      throw Exception('Error');
    }
  }
}

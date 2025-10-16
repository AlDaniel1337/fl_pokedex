import 'package:dio/dio.dart';
import 'package:fl_pokedex/core/plugins/http/http.class.dart';

class DioPlugin implements HttpClass{

  late Dio _http;

  DioPlugin(String baseUrl) {
    _http = Dio(
      BaseOptions(
        baseUrl: baseUrl
      )
    );
  }

  @override
  Future<Map<String, dynamic>> getResponse( String url ) async {
    try {
      final response = await _http.get(url);
      return response.data;
    } catch (e) {
      print('Error en la petición: $e');
      return {'error': 'Error en la petición: $e'};
    }
  }
}
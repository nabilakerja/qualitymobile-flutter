// dio_config.dart
import 'package:dio/dio.dart';

Dio dio = Dio();

class DioConfig {
  static void configureDio() {
    dio.options.baseUrl = 'http://10.0.2.2:8000'; // Update with your Django backend URL
    dio.options.connectTimeout = 5000 as Duration?; // 5 seconds
    dio.options.receiveTimeout = 3000 as Duration?; // 3 seconds
  }
}

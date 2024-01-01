import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = "https://coded-meditation.eapi.joincoded.com";

class Client {
  static final Dio dio = Dio(
    BaseOptions(baseUrl: baseUrl),
  );

  static Future<void> addAuthToken() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    String? token = shared.getString('token');

    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  static Future<Response> get(String path) async {
    await addAuthToken();
    try {
      // print(dio.options.headers['Authorization'].toString());
      return await dio.get(path);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<Response> put(String path) async {
    await addAuthToken();
    try {
      // print(dio.options.headers['Authorization'].toString());
      return await dio.put(path);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<Response> post(String path) async {
    await addAuthToken();
    try {
      // print(dio.options.headers['Authorization'].toString());
      return await dio.post(path);
    } catch (error) {
      throw error.toString();
    }
  }

  static Future<Response> delete(String path) async {
    await addAuthToken();
    try {
      // print(dio.options.headers['Authorization'].toString());
      return await dio.delete(path);
    } catch (error) {
      throw error.toString();
    }
  }
}

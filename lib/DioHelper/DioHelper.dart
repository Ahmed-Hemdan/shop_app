import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> signin({
    required String email,
    required password,
  }) async {
    return await dio!.post("login", data: {
      "email": email,
      "password": password,
    });
  }

  static Future<Response> signup({
    required String email,
    required password,
    required name,
    required phone,
  }) async {
    return dio!.post("register", data: {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
    });
  }

  static Future<Response> getData({
    required String endPoint,
    String? token,
  }) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "lang": "ar",
      "Authorization": token,
    };
    return await dio!.get(endPoint);
  }
}

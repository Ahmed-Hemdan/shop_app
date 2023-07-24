

import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

 static Future<Response> signin({
    required String email,
    required  password,
  }) async {
    return dio!.post("login", data: {
      "email": email,
      "password": password,
    });
  }

   static Future<Response> signup({
    required String email,
    required  password,
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
}

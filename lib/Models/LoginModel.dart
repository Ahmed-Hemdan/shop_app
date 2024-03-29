import 'package:shop_app/Models/UserDataModel.dart';

class LoginModel {
  bool? status;
  String? message;
  UserDataModel? data;
  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"]  != null ? UserDataModel.fromJson(json['data']) : null ;
  }
}

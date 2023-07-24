import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/DioHelper/DioHelper.dart';
import 'package:shop_app/Models/LoginModel.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitial());
  static ShopCubit get(context) => BlocProvider.of(context);

  IconData suficon = Icons.remove_red_eye_sharp;
  bool isSecure = false;
  showPassword() {
    isSecure = !isSecure;
    isSecure ? suficon = Icons.visibility_off : suficon = Icons.visibility;
    emit(ShowPassword());
  }

  LoginModel? loginData;

  void login({
    required String email,
    required password,
  }) {
    emit(LoginLoadingState());
    DioHelper.signin(
      email: email,
      password: password,
    ).then((value) {
      print(value.data.toString());
      loginData = LoginModel.fromJson(value.data);
      print(loginData!.message);
      print(loginData!.data!.email);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  void register({
    required String email,
    required password,
    required name,
    required phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.signup(
      email: email,
      password: password,
      name: name,
      phone: phone,
    ).then((value) {
      print(value.data.toString());
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErroeState());
    });
  }
}

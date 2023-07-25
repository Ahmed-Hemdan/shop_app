import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
      loginData = LoginModel.fromJson(value.data);

      print(loginData!.status);

      if (loginData!.status == false) {
        emit(LoginSuccessState());
        return Fluttertoast.showToast(
          msg: "${loginData!.message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0.sp,
        );
      } else {
        emit(LoginSuccessState());
        Fluttertoast.showToast(
          msg: "${loginData!.message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0.sp,
        );
      }
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
      return null;
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

  bool onBoarding =false;

}

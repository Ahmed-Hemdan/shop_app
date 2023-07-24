part of 'shop_cubit.dart';

abstract class ShopState {}

class ShopInitial extends ShopState {}

class ShowPassword extends ShopState{}

class LoginLoadingState extends ShopState {}

class LoginSuccessState extends ShopState {}

class LoginErrorState extends ShopState {}

class RegisterLoadingState extends ShopState {}

class RegisterSuccessState extends ShopState {}

class RegisterErroeState extends ShopState {}

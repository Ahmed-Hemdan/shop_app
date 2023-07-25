part of 'shop_cubit.dart';

abstract class ShopStates {}

class ShopInitial extends ShopStates {}

class ShowPassword extends ShopStates {}

class LoginLoadingState extends ShopStates {}

class LoginSuccessState extends ShopStates {}

class LoginErrorState extends ShopStates {}

class RegisterLoadingState extends ShopStates {}

class RegisterSuccessState extends ShopStates {}

class RegisterErroeState extends ShopStates {}

class ChangeNavCurrentIndex extends ShopStates {}

class GetHomeDataLoading extends ShopStates {}

class GetHomeDataSuccess extends ShopStates {}

class GetHomeDataError extends ShopStates {}

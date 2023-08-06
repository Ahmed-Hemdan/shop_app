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

class GetCategoriesDataLoading extends ShopStates {}

class GetCategoriesDataSuccess extends ShopStates {}

class GetCategoriesDataError extends ShopStates {}

class MakeProductInFavoritsLoading extends ShopStates {}

class MakeProductInFavoritsSuccess extends ShopStates {}

class MakeProductInFavoritsError extends ShopStates {}

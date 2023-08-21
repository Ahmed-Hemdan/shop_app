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

class DeleteProductFromFavoritsError extends ShopStates {}

class DeleteProductFromFavoritsSuccess extends ShopStates {}

class DeleteProductFromFavoritsLoading extends ShopStates {}

class GetFavoritsDataSuccess extends ShopStates {}

class GetFavoritsDataLoading extends ShopStates {}

class GetFavoritsDataError extends ShopStates {}

class ChangeAppTheme extends ShopStates {}

class GetUserDataSuccess extends ShopStates {}

class GetUserDataLoading extends ShopStates {}

class GetUserDataError extends ShopStates {}

class LogOutSuccess extends ShopStates {}

class LogOutError extends ShopStates {}

class EditProfileSuccess extends ShopStates {}

class EditProfileError extends ShopStates {}

class GetSearchLoading extends ShopStates {}
class GetSearchSuccess extends ShopStates {}
class GetSearchError extends ShopStates {}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/DioHelper/DioHelper.dart';
import 'package:shop_app/Models/LoginModel.dart';
import 'package:shop_app/Screens/Categories/CategoriesScreen.dart';
import 'package:shop_app/Screens/Favorites/FavoritesScreen.dart';
import 'package:shop_app/Screens/Products/ProductsScreen.dart';
import 'package:shop_app/Screens/Settings/SettingsScreen.dart';
import 'package:shop_app/shared/shared_preferences.dart';

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

  Future<void> login({
    required String email,
    required password,
  }) async {
    emit(LoginLoadingState());
    await DioHelper.signin(
      email: email,
      password: password,
    ).then((value) {
      loginData = LoginModel.fromJson(value.data);

      print(loginData!.status);

      if (loginData!.status == false) {
        emit(LoginSuccessState());
        return showtoast(text: "${loginData!.message}", color: Colors.red);
      } else {
        emit(LoginSuccessState());
        CacheHelper.setData(key: "token", value: loginData!.data!.token);
        showtoast(text: "${loginData!.message}", color: Colors.green);
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

  int currentIndex = 0;
  void changeNavCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeNavCurrentIndex());
  }

  List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.inventory_2_rounded,
      ),
      label: "Products",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_rounded,
      ),
      label: "Favorites",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.category_rounded,
      ),
      label: "Categories",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: "Settings",
    ),
  ];
  List<Widget> screens = const [
    ProductsScreen(),
    FavoritesScreen(),
    CategoriesScreen(),
    SettingsScreen(),
  ];
}

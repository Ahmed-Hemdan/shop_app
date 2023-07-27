import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/DioHelper/DioHelper.dart';
import 'package:shop_app/Global/Global.dart';
import 'package:shop_app/Models/HomeModel.dart';
import 'package:shop_app/Models/LoginModel.dart';
import 'package:shop_app/Screens/Categories/CategoriesScreen.dart';
import 'package:shop_app/Screens/Favorites/FavoritesScreen.dart';
import 'package:shop_app/Screens/Home/HomeScreen.dart';
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
      emit(RegisterSuccessState());
    }).catchError((error) {
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
        Icons.home,
      ),
      label: "Home",
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
    HomeScreen(),
    FavoritesScreen(),
    CategoriesScreen(),
    SettingsScreen(),
  ];

  HomeModel? homeData;
  void getHomeData() {
    emit(GetHomeDataLoading());
    DioHelper.getData(
      endPoint: "home",
      token: token,
    ).then((value) {
      homeData = HomeModel.fromJson(value.data);

      emit(GetHomeDataSuccess());
    }).catchError((error) {
      emit(GetHomeDataError());
    });
  }
}

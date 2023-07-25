import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/DioHelper/DioHelper.dart';
import 'package:shop_app/Global/Global.dart';
import 'package:shop_app/Screens/Layout/LayoutScreen.dart';
import 'package:shop_app/Screens/Login/LoginScreen.dart';
import 'package:shop_app/Screens/OnboardingScreen/OnboardingScreen.dart';
import 'package:shop_app/Themes/Themes.dart';
import 'package:shop_app/cubit/bloc_observer.dart';
import 'package:shop_app/cubit/shop_cubit.dart';
import 'package:shop_app/shared/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  onboard = CacheHelper.getData(key: 'board') ?? false;
  token = CacheHelper.getData(key: "token");
  print(token);
  if (onboard == true) {
    if (token != null) {
      startScreen = const LayoutScreen();
    } else {
      startScreen = const LoginScreen();
    }
  } else {
    startScreen = OnboardingScreen();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit()..getHomeData(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: lightTheme,
          home: startScreen,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/DioHelper/DioHelper.dart';

import 'package:shop_app/Screens/Login/LoginScreen.dart';
import 'package:shop_app/Screens/OnboardingScreen/OnboardingScreen.dart';
import 'package:shop_app/cubit/bloc_observer.dart';
import 'package:shop_app/cubit/shop_cubit.dart';
import 'package:shop_app/shared/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? board = CacheHelper.getData(key: 'board') ?? false;
  print(board);
  runApp( MyApp(board!));
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp(this.onboarding, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: onboarding ==false ? OnboardingScreen(): const LoginScreen(),
        ),
      ),
    );
  }
}

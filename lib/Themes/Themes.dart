import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ),
    backgroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.cyan[600],
    elevation: 0,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 25.sp,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 15.sp,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xff303030),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xff303030),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Color(0xff303030),
    ),
  ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.cyan[600],
    elevation: 0,
    backgroundColor: const Color(0xff303030),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 25.sp,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 15.sp,
    ),
  ),
);
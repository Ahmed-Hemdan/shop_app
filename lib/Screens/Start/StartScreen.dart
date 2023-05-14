import 'package:flutter/material.dart';

import 'package:shop_app/Screens/OnBord/OnBordingScreen1.dart';
import 'package:shop_app/Screens/OnBord/OnBordingScreen2.dart';
import 'package:shop_app/Screens/OnBord/OnBordingScreen3.dart';
import 'package:shop_app/cubit/shop_cubit.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: ShopCubit.get(context).controller,
        physics: const BouncingScrollPhysics(),
        children: const [
          OnBordingScreenOne(),
          OnBordingScreenTwo(),
          OnBordingScreenthree(),
        ],
      ),
    );
  }
}

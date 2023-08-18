import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/Global/Global.dart';
import 'package:shop_app/Screens/Login/LoginScreen.dart';
import 'package:shop_app/cubit/shop_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 130.h,
                  height: 130.h,
                  child: ClipOval(
                    child: Image.asset('assets/images/profile.jpg'),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 0,
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.cyan[300],
                    ),
                    child: IconButton(
                      onPressed: () {
                        ShopCubit.get(context).getProfile();
                      },
                      icon: const Icon(Icons.add_photo_alternate),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.cyan[300]!.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  profileItem(Icons.person, "${ShopCubit.get(context).userData.name}", getCurrentTag),
                  profileItem(Icons.email, "${ShopCubit.get(context).userData.email}", getCurrentTag),
                  profileItem(Icons.phone, "${ShopCubit.get(context).userData.phone}", getCurrentTag),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Dark mode",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CupertinoSwitch(
                    activeColor: Colors.cyan[300],
                    value: theme,
                    onChanged: (bool value) => ShopCubit.get(context).switchTheme(),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Do you wanna logout :(  ?"),
                TextButton(
                    onPressed: () {
                      ShopCubit.get(context).logOut();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false);
                      print(token);
                    },
                    child: const Text("Logout"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

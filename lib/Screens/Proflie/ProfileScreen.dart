import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/Global/Global.dart';
import 'package:shop_app/Screens/Login/LoginScreen.dart';
import 'package:shop_app/cubit/shop_cubit.dart';
import 'package:shop_app/shared/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey _formKey =  GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.showBottomSheet(
                        (context) => bottomSheetItem(
                          context: context,
                          emailController: emailController,
                          nameController: nameController,
                          phoneController: phoneController,
                          formKey: _formKey
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
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
                      onPressed: () {},
                      icon: const Icon(Icons.add_photo_alternate),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            BlocConsumer<ShopCubit, ShopStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return ShopCubit.get(context).userData == null
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.cyan[300]!.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            profileItem(Icons.person, "${ShopCubit.get(context).userData!.name}"),
                            profileItem(Icons.email, "${ShopCubit.get(context).userData!.email}"),
                            profileItem(Icons.phone, "${ShopCubit.get(context).userData!.phone}"),
                          ],
                        ),
                      );
              },
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
                    CachHelper.clearData(key: "token");
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false);
                  },
                  child: const Text("Logout"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

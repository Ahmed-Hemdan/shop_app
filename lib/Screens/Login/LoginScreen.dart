import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/Screens/Register/RegisterScreen.dart';
import 'package:shop_app/cubit/shop_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Login now to browse your social media.",
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0.h),
                  child: defaultTextFormField(
                    hint: 'Email',
                    icon: const Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value == null) {
                        return 'cant be impty';
                      } else {
                        null;
                      }
                      return null;
                    },
                    controller: ShopCubit.get(context).emailController,
                  ),
                ),
                BlocConsumer<ShopCubit, ShopState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return defaultTextFormField(
                      validate: (value) {
                        if (value == null) {
                          return 'cant be impty';
                        } else {
                          null;
                        }
                        return null;
                      },
                      controller: ShopCubit.get(context).passwordController,
                      hint: 'Password',
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      type: TextInputType.text,
                      scure: ShopCubit.get(context).isSecure,
                      sufIcon: Icons.remove_red_eye_sharp,
                      sufBut: () => ShopCubit.get(context).showPassword(),
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                defaultButton(
                  onpressed: () {},
                  text: "Login",
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style: TextStyle(
                          fontSize: 17.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

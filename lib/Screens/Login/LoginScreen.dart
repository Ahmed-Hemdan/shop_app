import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/Screens/Layout/LayoutScreen.dart';
import 'package:shop_app/Screens/Register/RegisterScreen.dart';
import 'package:shop_app/cubit/shop_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RegExp emailReg = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
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
                        if (value!.isEmpty) {
                          return 'cant be impty';
                        } else if (emailReg.hasMatch(value)) {
                          return null;
                        } else {
                          return "enter a vaild email";
                        }
                      },
                      controller: emailController,
                    ),
                  ),
                  BlocConsumer<ShopCubit, ShopStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return defaultTextFormField(
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'cant be impty';
                          } else if (value.length < 6) {
                            return "password is too short";
                          } else {
                            return null;
                          }
                        },
                        controller: passwordController,
                        hint: 'Password',
                        icon: const Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        type: TextInputType.text,
                        scure: ShopCubit.get(context).isSecure,
                        sufIcon: ShopCubit.get(context).suficon,
                        sufBut: () => ShopCubit.get(context).showPassword(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocConsumer<ShopCubit, ShopStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is! LoginLoadingState) {
                        return defaultButton(
                          onpressed: () async {
                            if (_formKey.currentState!.validate()) {
                              ShopCubit.get(context)
                                  .login(
                                email: emailController.text,
                                password: passwordController.text,
                              )
                                  .then((value) {
                                if (ShopCubit.get(context).loginData!.status == true) {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LayoutScreen(),
                                    ),
                                    (route) => false,
                                  );
                                } else {
                                  return null;
                                }
                              });
                            }
                          },
                          text: "Login",
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                    },
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
                            emailController.clear();
                            passwordController.clear();
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

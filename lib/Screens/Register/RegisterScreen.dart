import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/cubit/shop_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RegExp emailReg = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp phoneReg = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "REGISTER",
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Register now to browse your social media.",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  defaultTextFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    icon: const Icon(Icons.person_sharp),
                    hint: 'Name',
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Your name can't be empty";
                      } else if (value.length <= 2) {
                        return "Name is too short ";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  defaultTextFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    icon: const Icon(Icons.phone),
                    hint: 'Phone',
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "please enter your phone";
                      } else if (phoneReg.hasMatch(value)) {
                        return null;
                      } else {
                        return "enter a vaild phone number";
                      }
                    },
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
                          } else if (value.length <= 6) {
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
                        type: TextInputType.visiblePassword,
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
                      if (state is! RegisterLoadingState) {
                        return defaultButton(
                          onpressed: () {
                            ShopCubit.get(context).register(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                              phone: phoneController.text,
                            );
                          },
                          text: "Register",
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
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/cubit/shop_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    controller: ShopCubit.get(context).nameController,
                    type: TextInputType.name,
                    icon: const Icon(Icons.person_sharp),
                    hint: 'Name',
                    validate: (value) {
                      return null;
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
                  defaultTextFormField(
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
                    type: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  defaultButton(
                    onpressed: () {},
                    text: "Register",
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

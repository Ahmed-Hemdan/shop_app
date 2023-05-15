import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 53.h,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.0.w),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: "VarelaRound",
                    color: const Color(0xFFF58634),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 130.h,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0.w),
                child: Text(
                  'Email Id',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "VarelaRound",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Center(
            child: SizedBox(
              width: 296.w,
              height: 48.h,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your email id",
                  hintStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300, fontFamily: "Poppins"),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: const Color(0xFFF4D1A1),
                    size: 24.h,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFF3A940),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFF3A940),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0.w),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "VarelaRound",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Center(
            child: SizedBox(
              width: 296.w,
              height: 48.h,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Poppins",
                  ),
                  // prefixIcon: SizedBox(
                  //   width: 5.w,
                  //   height: 10.h,
                  //   child: const Flexible(
                  //     child: ImageIcon(
                  //       AssetImage("assets/images/lock.png"),
                  //       color: Color(0xFFF4D1A1),
                  //     ),
                  //   ),
                  // ),
                  prefixIcon: Icon(
                    Icons.lock_rounded,
                    color: const Color(0xFFF4D1A1),
                    size: 24.h,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFF3A940),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFF3A940),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 11.h,
          ),
          SizedBox(
            width: 296.w,
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 12.sp,
                    fontFamily: "Poppins",
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          SizedBox(
            width: 160.w,
            height: 40.h,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF58634)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                "LOGIN",
                style: TextStyle(
                  fontFamily: "VarelaRound",
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          Center(
            child: SizedBox(
              width: 296.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 98.w,
                    height: 28.h,
                    child: Text(
                      "ARE YOU A NEW \n USER?",
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: "VarelaRound ",
                        fontSize: 12.sp,
                        color: const Color(0xffF58634),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontFamily: "VarelaRound ",
                        fontSize: 12.sp,
                        color: const Color(0xffF58634),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

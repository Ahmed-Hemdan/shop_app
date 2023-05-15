import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Screens/LoginScreen.dart';
import 'package:shop_app/cubit/shop_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingScreenthree extends StatelessWidget {
  const OnBordingScreenthree({super.key});

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
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: IconButton(
                  onPressed: () {
                    ShopCubit.get(context).controller.animateToPage(1, duration: const Duration(milliseconds: 550), curve: Curves.fastOutSlowIn);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFF58634),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 73.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
            child: Image(
              width: 336.w,
              height: 336.h,
              image: const AssetImage('assets/images/donation3.png'),
            ),
          ),
          Text(
            "We are here you to take care of your \n product shring and donation.",
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(
            height: 43.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: ShopCubit.get(context).controller,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(spacing: 4.0, radius: 5.0, dotWidth: 7.0, dotHeight: 8.0, paintStyle: PaintingStyle.fill, strokeWidth: 1.5, dotColor: Color(0xFFF58634), activeDotColor: Color(0xFFF58634)),
                ),
                FloatingActionButton(
                  elevation: 0.0,
                  backgroundColor: const Color(0xFFF58634),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14.h,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

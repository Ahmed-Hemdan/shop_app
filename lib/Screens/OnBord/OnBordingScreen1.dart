import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/cubit/shop_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingScreenOne extends StatelessWidget {
  const OnBordingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 164.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
            child: Image(
              width: 336.w,
              height: 336.h,
              image: const AssetImage('assets/images/donation1.png'),
            ),
          ),
          Text(
            'Give your products to one who actually \n need it rather than selling/throwing it',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(
            height: 50.h,
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
                    ShopCubit.get(context).controller.animateToPage(1, duration: const Duration(milliseconds: 550), curve: Curves.fastOutSlowIn);
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

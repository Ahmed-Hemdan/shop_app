import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/cubit/shop_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingScreenTwo extends StatelessWidget {
  const OnBordingScreenTwo({super.key});

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
                    ShopCubit.get(context).controller.animateToPage(0, duration: const Duration(seconds: 1), curve: Curves.bounceIn);
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
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
            child: Image(
              width: 336.w,
              height: 336.h,
              image: const AssetImage('assets/images/donation2.png'),
            ),
          ),
          Text(
            "Door-Door delivery is not something \n that you need to wory about. \n We’ll take care of delivery",
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
                    ShopCubit.get(context).controller.animateToPage(2, duration: const Duration(seconds: 1), curve: Curves.bounceIn);
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Components/Components.dart';
import 'package:shop_app/Models/onboardingModel.dart';
import 'package:shop_app/Screens/Login/LoginScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnboardingScreen extends StatelessWidget {
  final List<OnboardingModel> onboarding = [
    OnboardingModel(
      image: 'assets/images/onboarding/onboarding_1.png',
      title: "Onboarding screen 1 title",
      body: 'Onboarding screen 1 body',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding/onboarding_2.png',
      title: "Onboarding screen 2 title",
      body: 'Onboarding screen 2 body',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding/onboarding_3.png',
      title: "Onboarding screen 3 title",
      body: 'Onboarding screen 3 body',
    ),
  ];
  final PageController controller = PageController();
  bool isLast = false;
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false);
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (index) {
                  if (index == onboarding.length - 1) {
                    isLast = true;
                  } else {
                    isLast = false;
                  }
                },
                itemCount: onboarding.length,
                itemBuilder: (context, index) => onboardingWidget(onboarding[index]),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: controller, // PageController
                  count: onboarding.length,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    spacing: 6,
                    dotColor: Colors.grey,
                  ), // your preferred effect
                ),
                const Spacer(),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (isLast == false) {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      } else {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => false);
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

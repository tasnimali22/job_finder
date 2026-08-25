import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CardSmoothPageIndictor extends StatelessWidget {
  const CardSmoothPageIndictor({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller, // PageController
      count: 3,
      effect: WormEffect(
        dotHeight: 6.h,
        dotWidth: 6.w,

        activeDotColor: AppColors.primary500,
      ), // your preferred effect
      onDotClicked: (index) {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      },
    );
  }
}

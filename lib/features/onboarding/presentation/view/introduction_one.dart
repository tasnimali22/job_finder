import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/core/util/asset_image.dart';
import 'package:jobs_que_app/core/widgets/custom_app_bar.dart';
import 'package:jobs_que_app/core/widgets/custom_button.dart';
import 'package:jobs_que_app/features/onboarding/presentation/widget/card_smoothpageindictor.dart';

class IntroductionOne extends StatelessWidget {
  const IntroductionOne({super.key, required this._controller});
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      child: Column(
        children: [
          const CustomAppBar(),
          Image.asset(AssetImageData.intro1, fit: BoxFit.contain),
          const Spacer(),

          RichText(
            text: TextSpan(
              style: AppTextStyles.heading1Medium,
              children: [
                const TextSpan(text: "Find a job, and "),
                TextSpan(
                  text: "start building ",
                  style: AppTextStyles.heading1Mediumb,
                ),
                const TextSpan(text: "your career from now on "),
              ],
            ),
          ),

          const Spacer(),

          Text(
            "Explore over 25,924 available job roles and upgrade your operator now.",
            style: AppTextStyles.textLRegularN,
            textAlign: TextAlign.center,
          ),
          const Spacer(),

          CardSmoothPageIndictor(controller: _controller),
          const Spacer(),

          CustomBotton(
            text: "Next",
            onPressed: () {
              _controller.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

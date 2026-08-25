import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/core/util/asset_image.dart';
import 'package:jobs_que_app/core/widgets/custom_app_bar.dart';
import 'package:jobs_que_app/core/widgets/custom_button.dart';
import 'package:jobs_que_app/features/onboarding/presentation/widget/card_smoothpageindictor.dart';

class IntroductionThere extends StatelessWidget {
  const IntroductionThere({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      child: Column(
        children: [
          const CustomAppBar(),
          Image.asset(AssetImageData.intro3, fit: BoxFit.contain),
          const Spacer(),

          RichText(
            text: TextSpan(
              style: AppTextStyles.heading1Medium,
              children: [
                const TextSpan(text: "Get the best "),
                TextSpan(
                  text: "choice for the job ",
                  style: AppTextStyles.heading1Mediumb,
                ),
                const TextSpan(text: " you've always dreamed of "),
              ],
            ),
          ),

          const Spacer(),

          Text(
            "Get the best choice for the job you've always dreamed of",
            style: AppTextStyles.textLRegularN,
            textAlign: TextAlign.center,
          ),
          const Spacer(),

          CardSmoothPageIndictor(controller: controller),
          const Spacer(),

          CustomBotton(
            text: "Get Started",
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kLogin);
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

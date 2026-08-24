import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/core/util/asset_image.dart';
import 'package:jobs_que_app/core/widgets/custom_app_bar.dart';
import 'package:jobs_que_app/core/widgets/custom_button.dart';
import 'package:jobs_que_app/features/onboarding/presentation/widget/card_smoothpageindictor.dart';

class IntroductionTwo extends StatelessWidget {
  const IntroductionTwo({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      child: Column(
        children: [
          CustomAppBar(),
          Image.asset(AssetImageData.intro2, fit: BoxFit.contain),
          Spacer(),
          RichText(
            text: TextSpan(
              style: AppTextStyles.heading1Medium,
              children: [
                TextSpan(text: "Hundreds of jobs are waiting for you to "),
                TextSpan(
                  text: "join together",
                  style: AppTextStyles.heading1Mediumb,
                ),
              ],
            ),
          ),
          Spacer(),

          Text(
            "Immediately join us and start applying for the job you are interested in.",
            style: AppTextStyles.textLRegularN,
            textAlign: TextAlign.center,
          ),
          Spacer(),

          CardSmoothPageIndictor(controller: controller),
          Spacer(),

          CustomBotton(
            text: "Next",
            onPressed: () {
              controller.nextPage(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/core/util/app_style.dart';

class CustomLink extends StatelessWidget {
  const CustomLink({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.r),
      width: 160.w,
      height: 77.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral200, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.textSRegular),
          Text(subtitle, style: AppTextStyles.textMMedium),
        ],
      ),
    );
  }
}

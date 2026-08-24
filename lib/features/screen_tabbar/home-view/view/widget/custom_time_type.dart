import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class CustomTimeType extends StatelessWidget {
  const CustomTimeType({
    super.key,
    required this.timeType,
    required this.style,
  });
  final String timeType;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 80.w,
      padding: EdgeInsets.all(2.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.r),
        color: AppColors.primary200.withValues(alpha: 0.5),
      ),
      child: Center(child: Text(timeType, style: style)),
    );
  }
}

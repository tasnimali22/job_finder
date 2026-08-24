import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class CustomCardTapBar extends StatelessWidget {
  const CustomCardTapBar({super.key, required this.tap1, required this.tap2});
  final String tap1;
  final String tap2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.circular(23.r),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: AppColors.information900,
          borderRadius: BorderRadius.circular(23.r),
        ),
        dividerColor: Colors.transparent,
        labelColor: AppColors.primary10,

        tabs: [Text(tap1), Text(tap2)],
      ),
    );
  }
}

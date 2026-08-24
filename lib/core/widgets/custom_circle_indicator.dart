import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomCircleIndicator extends StatelessWidget {
  const CustomCircleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Shimmer.fromColors(
        baseColor: AppColors.neutral400,
        highlightColor: AppColors.neutral600,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Container(child: Text(""));
          },
        ),
      ),
    );
  }
}

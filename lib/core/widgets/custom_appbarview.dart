import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/core/util/asset_image.dart';

class CustomAppBarView extends StatelessWidget {
  const CustomAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_rounded, color: AppColors.neutral550),
          ),
          Image.asset(
            AssetImageData.logo,
            height: 19.h,
            width: 81.w,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

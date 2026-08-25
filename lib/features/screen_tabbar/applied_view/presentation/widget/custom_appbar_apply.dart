import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_style.dart';

class CustomAppbarapply extends StatelessWidget {
  const CustomAppbarapply({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          SizedBox(width: 80.w),
          Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyles.heading4Medium,
            ),
          ),
        ],
      ),
    );
  }
}

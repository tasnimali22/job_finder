import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/features/auth/login/view/widget/check_box_remember.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const CheckBoxRemeber(),
        SizedBox(width: 2.w),
        Text("Remember me", style: AppTextStyles.textMRegular),
        const Spacer(),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kSignUp);
          },
          child: Text("Forgot Password?", style: AppTextStyles.textMRegularp),
        ),
      ],
    );
  }
}

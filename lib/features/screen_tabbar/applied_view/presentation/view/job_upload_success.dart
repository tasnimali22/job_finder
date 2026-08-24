import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/util/asset_image.dart';
import 'package:jobs_que_app/core/widgets/custom_button.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/custom_appbar_apply.dart';

class JobUploadSuccess extends StatelessWidget {
  const JobUploadSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: Column(
          children: [
            CustomAppbarapply(text: 'Apply Job'),
            SizedBox(height: 50.h),
            Center(
              child: Image.asset(AssetImageData.success, fit: BoxFit.contain),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.only(bottom: 40.h, left: 24.w, right: 24.w),
        child: CustomBotton(
          text: "Back to Home",
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kHome);
          },
        ),
      ),
    );
  }
}

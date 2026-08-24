import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/model/all_job_model.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/detelis.dart/custom_link_company.dart';

class Company extends StatelessWidget {
  const Company({super.key, required this.details});
  final AllJobModel details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Contact Us"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomLink(title: 'Email', subtitle: details.compEmail ?? ""),
            CustomLink(title: 'Website', subtitle: details.compWebsite ?? ""),
          ],
        ),
        SizedBox(height: 24.h),
        Text("About Company", style: AppTextStyles.textMMedium),
        SizedBox(height: 8.h),
        Text(details.aboutComp ?? "", style: AppTextStyles.textSRegularb),
      ],
    );
  }
}

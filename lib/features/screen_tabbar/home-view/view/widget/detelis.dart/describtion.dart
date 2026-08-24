import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/model/all_job_model.dart';

class Describtion extends StatelessWidget {
  const Describtion({super.key, required this.details});

  final AllJobModel details;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Job Description", style: AppTextStyles.textMMedium),
          SizedBox(height: 8.h),
          Text(
            details.jobDescription ?? "",
            style: AppTextStyles.textSRegularb,
          ),
          SizedBox(height: 20.h),
          Text("Skill Required", style: AppTextStyles.textMMedium),
          SizedBox(height: 8.h),
          Text(details.jobSkill ?? "", style: AppTextStyles.textSRegularb),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/core/widgets/custom_button.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/model/all_job_model.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/custom_type_job.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/detelis.dart/custom_card_tapbar.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/detelis.dart/company.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/detelis.dart/describtion.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/detelis.dart/job_detelis_appbar.dart';

class CustomDefaultTabController extends StatelessWidget {
  const CustomDefaultTabController({super.key, required this.details});
  final AllJobModel details;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: EdgeInsets.only(
          top: 60.h,
          right: 24.w,
          left: 24.w,
          bottom: 40.h,
        ),
        child: Column(
          children: [
            JobDetelisAppbar(),
            CachedNetworkImage(
              imageUrl: details.image ?? "",
              fit: BoxFit.contain,
              height: 48.h,
              width: 48.w,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),

            SizedBox(height: 12.h),
            Text(details.name ?? "", style: AppTextStyles.heading4Medium),
            Text(
              "${details.compName} • ${details.jobType}, ${details.location}",
              style: AppTextStyles.textSRegular,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: CustomTypeJobRow(style: AppTextStyles.textSRegularpr),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: CustomCardTapBar(tap1: 'Describtion', tap2: 'Company'),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Describtion(details: details),
                  Company(details: details),
                ],
              ),
            ),
            CustomBotton(
              text: "Apply Now",
              onPressed: () {
                GoRouter.of(context).push(
                  AppRouter.kApplyJob,
                  extra: details.id,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

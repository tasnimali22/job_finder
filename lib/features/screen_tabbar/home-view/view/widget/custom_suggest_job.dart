import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/custom_type_job.dart';

class CustomSuggestJob extends StatelessWidget {
  const CustomSuggestJob({
    super.key,
    required this.jobId,
    required this.image,
    required this.nameJob,
    required this.compname,
    required this.location,
    required this.salary,
  });
  final String image;
  final int? jobId;
  final String nameJob;
  final String compname;
  final String location;
  final String salary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      height: 183.h,
      width: 350.w,
      decoration: BoxDecoration(
        color: AppColors.primary900,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CachedNetworkImage(
                fit: BoxFit.contain,
                height: 40.h,
                width: 40.w,
                imageUrl: image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.clip,
                    nameJob,
                    style: AppTextStyles.heading5Mediumw15,
                  ),
                  Text(
                    overflow: TextOverflow.clip,
                    "$compname • "
                            "$location"
                        .substring(0, 20),

                    style: AppTextStyles.textSMediu,
                  ),
                ],
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(Icons.bookmark_border_rounded, color: Colors.white),
              ),
            ],
          ),
          CustomTypeJobRow(style: AppTextStyles.textSRegularw),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$salary"
                r"$",
                style: AppTextStyles.heading4Mediumw,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23.r),
                  ),
                  backgroundColor: AppColors.primary500,
                ),
                onPressed: () {
                  GoRouter.of(context).push(
                    AppRouter.kApplyJob,
                    extra: jobId,
                  );
                },
                child: Text("Apply now", style: AppTextStyles.textSMediumw),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/search_view/widget/searching.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/all_job_sliver_list.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/custom_row_welcome.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/suggest_job_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.h, right: 24.w, left: 24.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRowWelcom(),
                  Searching(),
                  Text("Suggest job", style: AppTextStyles.heading5Medium),
                  SuggestJobList(),
                  Text("Recent Job", style: AppTextStyles.heading5Medium),
                ],
              ),
            ),
            CustomSliverList(),
          ],
        ),
      ),
    );
  }
}

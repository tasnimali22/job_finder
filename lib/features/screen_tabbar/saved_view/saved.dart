import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/util/asset_image.dart';
import 'package:jobs_que_app/core/widgets/custom_circle_indicator.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/custom_appbar_apply.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/all_job_cubit/all_job_state.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/all_job_cubit/alljob_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/all_jobs.dart';
import 'package:jobs_que_app/features/screen_tabbar/saved_view/data/cubit/saved_cubit.dart';

class SavedView extends StatefulWidget {
  const SavedView({super.key});

  @override
  State<SavedView> createState() => _SavedViewState();
}

class _SavedViewState extends State<SavedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 24.w, left: 24.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CustomAppbarapply(text: 'saved')),
            BlocBuilder<AllJobCubit, AllJobState>(
              builder: (BuildContext context, AllJobState state) {
                if (state is AllJobSuccess) {
                  final savedJob = context.watch<SavedCubit>().savedJob;
                  final savedItems = state.items.where((item) {
                    final itemId = item.id?.toString() ?? "";
                    return savedJob.contains(itemId);
                  }).toList();

                  if (savedItems.isEmpty) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(child: Image.asset(AssetImageData.saved)),
                    );
                  }

                  return SliverList.separated(
                    itemCount: savedItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = savedItems[index];
                      final String itemId = item.id?.toString() ?? "";

                      return InkWell(
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).push(AppRouter.kDetails, extra: item);
                        },
                        child: AllJobs(
                          image: item.image ?? "",
                          nameJob: item.name ?? "",
                          compname: item.compName ?? "",
                          location: item.location ?? "",
                          salary: item.salary ?? "",
                          isSaved: savedJob.contains(itemId),
                          onSavedPressed: () {
                            context.read<SavedCubit>().saved(itemId);
                          },
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        thickness: 1,
                        indent: 16,
                        endIndent: 16,
                      );
                    },
                  );
                } else if (state is AllJobFailure) {
                  return SliverToBoxAdapter(child: Text(state.errMessage));
                } else {
                  return SliverToBoxAdapter(child: CustomCircleIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

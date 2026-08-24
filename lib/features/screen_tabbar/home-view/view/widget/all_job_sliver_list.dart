import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/widgets/custom_circle_indicator.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/all_job_cubit/all_job_state.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/all_job_cubit/alljob_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/all_jobs.dart';
import 'package:jobs_que_app/features/screen_tabbar/saved_view/data/cubit/saved_cubit.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllJobCubit, AllJobState>(
      builder: (BuildContext context, AllJobState state) {
        if (state is AllJobSuccess) {
          return SliverList.separated(
            itemCount: state.items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = state.items[index];
              final String itemId = item.id?.toString() ?? "";
              final bool isSaved = context
                  .watch<SavedCubit>()
                  .savedJob
                  .contains(itemId);
              return InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kDetails, extra: item);
                },
                child: AllJobs(
                  image: item.image ?? "",
                  nameJob: item.name ?? "",
                  compname: item.compName ?? "",
                  location: item.location ?? "",
                  salary: item.salary ?? "",
                  isSaved: isSaved,
                  onSavedPressed: () {
                    BlocProvider.of<SavedCubit>(context).saved(itemId);
                  },
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(thickness: 1, indent: 16, endIndent: 16);
            },
          );
        } else if (state is AllJobFailure) {
          return SliverToBoxAdapter(child: Text(state.errMessage));
        } else {
          return SliverToBoxAdapter(child: CustomCircleIndicator());
        }
      },
    );
  }
}

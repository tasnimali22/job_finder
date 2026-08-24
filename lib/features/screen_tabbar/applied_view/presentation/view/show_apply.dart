import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/widgets/custom_circle_indicator.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/active_job.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/custom_appbar_apply.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/rejected.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/data/show_apply_cubit/show_apply_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/all_job_cubit/all_job_state.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/all_job_cubit/alljob_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/detelis.dart/custom_card_tapbar.dart';

class ShowApply extends StatefulWidget {
  const ShowApply({super.key});

  @override
  State<ShowApply> createState() => _ShowApplyState();
}

class _ShowApplyState extends State<ShowApply> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<ShowApplyCubit>().applyJob();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 40.h),
          child: Column(
            children: [
              CustomAppbarapply(text: 'Apply Job'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: CustomCardTapBar(tap1: 'Active', tap2: 'Rejected'),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    BlocBuilder<AllJobCubit, AllJobState>(
                      builder: (context, state) {
                        if (state is AllJobLoading) {
                          return const CustomCircleIndicator();
                        }

                        if (state is AllJobFailure) {
                          return Center(child: Text(state.errMessage));
                        }

                        if (state is AllJobSuccess) {
                          return AppliedJobsScreen(allJobs: state.items);
                        }

                        return const SizedBox();
                      },
                    ),

                    Rejected(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

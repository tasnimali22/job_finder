import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/widgets/custom_circle_indicator.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/suggest_cubit.dart/cubit/suggest_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/custom_suggest_job.dart';

class SuggestJobList extends StatelessWidget {
  const SuggestJobList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 183.h,
      child: BlocBuilder<SuggestCubit, SuggestState>(
        builder: (context, state) {
          if (state is SuggestSuccess) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.suggest.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final item = state.suggest[index];

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.r),
                  child: InkWell(
                    onTap: () {
                      GoRouter.of(
                        context,
                      ).push(AppRouter.kDetails, extra: item);
                    },
                    child: CustomSuggestJob(
                      jobId: state.suggest[index].id,
                      image: state.suggest[index].image ?? "",
                      nameJob: state.suggest[index].name ?? "",
                      compname: state.suggest[index].compName ?? "",
                      location: state.suggest[index].location ?? "",
                      salary: state.suggest[index].salary ?? "",
                    ),
                  ),
                );
              },
            );
          } else if (state is SuggestFailure) {
            return Text(state.errMassage);
          } else {
            return const CustomCircleIndicator();
          }
        },
      ),
    );
  }
}

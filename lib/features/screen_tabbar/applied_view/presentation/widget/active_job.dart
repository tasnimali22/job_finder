import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que_app/core/util/asset_image.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/data/show_apply_cubit/show_apply_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/job_card_widget.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/model/all_job_model.dart';

class AppliedJobsScreen extends StatelessWidget {
  final List<AllJobModel> allJobs;

  const AppliedJobsScreen({super.key, required this.allJobs});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowApplyCubit, ShowApplyState>(
      builder: (context, state) {
        if (state is ShowApplyLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ShowApplyFailure) {
          return Center(child: Text(state.errMassage));
        }

        if (state is ShowApplySuccess) {
          final appliedJobs = allJobs.where((job) {
            return state.model.any((apply) => apply.jobsId == job.id);
          }).toList();

          if (appliedJobs.isEmpty) {
            return Center(child: Image.asset(AssetImageData.regested));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: appliedJobs.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final job = appliedJobs[index];

              return JobCardWidget(job: job);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}

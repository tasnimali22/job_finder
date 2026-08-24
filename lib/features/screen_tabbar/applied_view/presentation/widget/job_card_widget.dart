import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/job_apply_stepper.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/model/all_job_model.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/custom_type_job.dart';

class JobCardWidget extends StatelessWidget {
  final AllJobModel job;

  const JobCardWidget({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header (Logo + Title + Bookmark)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(
                  job.image ?? "",
                  errorBuilder: (_, __, ___) => const Icon(Icons.work),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.name ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${job.compName} • ${job.location}',
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.bookmark_border, color: Colors.blue),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),

          // 2. Chips & Date
          CustomTypeJobRow(style: AppTextStyles.textSRegularpr),
          SizedBox(height: 20.h),

          // 3. Progress Stepper
          JobApplyStepper(currentStep: 2),
        ],
      ),
    );
  }
}

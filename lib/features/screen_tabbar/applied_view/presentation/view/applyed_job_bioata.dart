import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/core/widgets/custom_button.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/data/apply_cubit/apply_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/custom_appbar_apply.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/form_applyed_job.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/job_apply_stepper.dart';

class ApplyedJobBioata extends StatelessWidget {
  ApplyedJobBioata({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplyCubit, ApplyState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppbarapply(text: 'Apply job'),
                  JobApplyStepper(currentStep: 1),
                  Text("Biodata", style: AppTextStyles.heading4Medium),
                  Text(
                    "Fill in your bio data correctly",
                    style: AppTextStyles.textMRegularn,
                  ),
                  FormApplyedJob(formKey: formKey),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsetsGeometry.only(
              bottom: 40.h,
              left: 24.w,
              right: 24.w,
            ),
            child: CustomBotton(
              text: "Next",
              onPressed: () {
                if (!formKey.currentState!.validate()) return;

                GoRouter.of(context).push(
                  AppRouter.kApplyuploadeJob,
                  extra: context.read<ApplyCubit>(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

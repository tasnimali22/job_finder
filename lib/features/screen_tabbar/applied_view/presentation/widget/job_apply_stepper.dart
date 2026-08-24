import 'package:flutter/material.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/stepper_step.dart';

class JobApplyStepper extends StatelessWidget {
  final int currentStep; // الخطوة الحالية المحددة

  const JobApplyStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // الخطوة 1: البيانات الشخصية
        Expanded(
          child: StepperStep(
            title: 'Biodata',
            stepNumber: '1',
            isActive: true, // هذه الخطوة مكتملة أو حالية
            isCompleted: true, // لعرض علامة الـ صح
          ),
        ),

        Expanded(
          child: StepperStep(
            title: 'Upload portfolio',
            stepNumber: '2',
            isActive: true, // خطوة مستقبلية (باهتة)
            isCompleted: false,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/core/util/app_style.dart';

class StepperStep extends StatelessWidget {
  final String title;
  final String stepNumber;
  final bool isActive; // هل الخطوة نشطة؟ (الحالية أو المكتملة)
  final bool isCompleted; // هل تم إكمالها؟ (لعرض Icon بدلاً من الرقم)

  const StepperStep({
    super.key,
    required this.title,
    required this.stepNumber,
    required this.isActive,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    // الألوان بناءً على الحالة
    const Color activeColor =
        AppColors.primary500; // اللون الأزرق للخطوات النشطة
    const Color inactiveColor =
        AppColors.neutral300; // اللون الرمادي للخطوات غير النشطة
    const Color textColor = AppColors.neutral500; // لون النص الرمادي الداكن

    return Column(
      children: [
        // الدائرة (الرقم أو علامة الـ صح)
        Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: isCompleted
                ? activeColor
                : Colors.white, // خلفية زرقاء إذا اكتملت، وإلا بيضاء
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? activeColor : inactiveColor, // لون الإطار
              width: 2,
            ),
          ),
          child: Center(
            child: isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 28)
                : Text(
                    stepNumber,
                    style: AppTextStyles.heading5Bold.copyWith(
                      color: isActive ? activeColor : inactiveColor,
                    ),
                  ),
          ),
        ),

        const SizedBox(height: 10), // مسافة صغيرة
        // عنوان الخطوة
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.textMMedium.copyWith(
            color: isActive ? textColor : inactiveColor,
          ),
        ),
      ],
    );
  }
}

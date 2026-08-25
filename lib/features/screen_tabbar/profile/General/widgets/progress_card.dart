import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 76,
          height: 76,
          child: CircularProgressIndicator(
            value: 0.5,
            strokeWidth: 8,
            backgroundColor: AppColors.primary100,
            color: AppColors.primary500,
          ),
        ),
        SizedBox(width: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2 of 4 completed',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 4),
            Text(
              'You are halfway there.',
              style: TextStyle(color: AppColors.neutral600),
            ),
          ],
        ),
      ],
    );
  }
}

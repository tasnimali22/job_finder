import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class PrivacyIntro extends StatelessWidget {
  const PrivacyIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lock_outline_rounded, color: Colors.white, size: 30),
          SizedBox(height: 16),
          Text(
            'Your privacy matters',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Here is how Jobsque handles your information.',
            style: TextStyle(color: AppColors.primary100, height: 1.5),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

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
          Icon(Icons.verified_user_outlined, color: Colors.white, size: 30),
          SizedBox(height: 16),
          Text(
            'A clear agreement',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please read these terms before using Jobsque.',
            style: TextStyle(color: AppColors.primary100, height: 1.5),
          ),
        ],
      ),
    );
  }
}

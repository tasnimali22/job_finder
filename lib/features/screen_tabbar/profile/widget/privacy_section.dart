import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class PrivacySection extends StatelessWidget {
  const PrivacySection({super.key, required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 7),
          Text(
            text,
            style: const TextStyle(color: AppColors.neutral600, height: 1.55),
          ),
        ],
      ),
    );
  }
}

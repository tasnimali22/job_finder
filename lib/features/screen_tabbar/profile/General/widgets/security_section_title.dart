import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class SecuritySectionTitle extends StatelessWidget {
  const SecuritySectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.neutral600,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

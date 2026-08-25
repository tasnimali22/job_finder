import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: AppColors.neutral600,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

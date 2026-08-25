import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class FieldLabel extends StatelessWidget {
  const FieldLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.neutral600,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

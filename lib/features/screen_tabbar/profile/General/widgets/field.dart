import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class Field extends StatelessWidget {
  const Field({
    super.key,
    required this.label,
    required this.controller,
    required this.hint,
    this.icon,
    this.onIconTap,
  });

  final String label;
  final TextEditingController controller;
  final String hint;
  final IconData? icon;
  final VoidCallback? onIconTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.neutral600,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: icon == null
                  ? null
                  : IconButton(onPressed: onIconTap, icon: Icon(icon)),
            ),
          ),
        ],
      ),
    );
  }
}

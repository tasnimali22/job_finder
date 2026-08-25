import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/core/util/app_style.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary900,
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/Profile_Background.png'),
          fit: BoxFit.cover,
          opacity: 0.18,
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 34,
            backgroundColor: AppColors.primary100,
            child: Icon(
              Icons.person_rounded,
              size: 38,
              color: AppColors.primary900,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'tasnim',
                  style: AppTextStyles.heading4Medium.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'flutter developer',
                  style: TextStyle(color: AppColors.primary100),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: Colors.white),
        ],
      ),
    );
  }
}

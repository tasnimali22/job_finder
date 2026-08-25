import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/general/widgets/completiontile.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/general/widgets/progress_card.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/widget/profile_routes.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complete profile'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary900,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Make your profile stand out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Complete these sections before applying for jobs.',
                  style: TextStyle(color: AppColors.primary100, height: 1.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const ProgressCard(),
          const SizedBox(height: 24),
          CompletionTile(
            icon: Icons.person_outline_rounded,
            title: 'Personal details',
            subtitle: 'Name, bio, address, and country',
            onTap: () => context.push(ProfileRoutes.edit),
          ),
          CompletionTile(
            icon: Icons.folder_open_outlined,
            title: 'Portfolio',
            subtitle: 'CV, certificates, and work samples',
            onTap: () => context.push(ProfileRoutes.portfolio),
          ),
          CompletionTile(
            icon: Icons.school_outlined,
            title: 'Education',
            subtitle: 'Add your academic background',
            onTap: () => context.push(ProfileRoutes.education),
          ),
          CompletionTile(
            icon: Icons.work_outline_rounded,
            title: 'Experience',
            subtitle: 'Add your professional experience',
            onTap: () => context.push(ProfileRoutes.experience),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/Profile.dart';

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
          const _ProgressCard(),
          const SizedBox(height: 24),
          _CompletionTile(
            icon: Icons.person_outline_rounded,
            title: 'Personal details',
            subtitle: 'Name, bio, address, and country',
            onTap: () => context.push(ProfileRoutes.edit),
          ),
          _CompletionTile(
            icon: Icons.folder_open_outlined,
            title: 'Portfolio',
            subtitle: 'CV, certificates, and work samples',
            onTap: () => context.push(ProfileRoutes.portfolio),
          ),
          _CompletionTile(
            icon: Icons.school_outlined,
            title: 'Education',
            subtitle: 'Add your academic background',
            onTap: () => context.push('/profile/education'),
          ),
          _CompletionTile(
            icon: Icons.work_outline_rounded,
            title: 'Experience',
            subtitle: 'Add your professional experience',
            onTap: () => context.push('/profile/experience'),
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard();

  @override
  Widget build(BuildContext context) {
    return Row(
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
        const SizedBox(width: 18),
        const Column(
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

class _CompletionTile extends StatelessWidget {
  const _CompletionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      color: AppColors.neutral100,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Icon(icon, color: AppColors.primary600, size: 28),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: onTap,
      ),
    );
  }
}

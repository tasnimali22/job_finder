import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/widget/option_title.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/widget/profile_heper.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/widget/profile_routes.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/widget/section_title.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  static const String route = '/profile';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  tooltip: 'Sign out',
                  onPressed: () => context.go('/Login'),
                  icon: const Icon(Icons.logout_rounded),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const ProfileHeader(),
            const SizedBox(height: 28),
            const SectionTitle('General'),
            const SizedBox(height: 8),
            OptionTile(
              icon: Icons.person_outline_rounded,
              title: 'Edit profile',
              subtitle: 'Update your personal information',
              onTap: () => context.push(ProfileRoutes.edit),
            ),
            OptionTile(
              icon: Icons.folder_open_outlined,
              title: 'Portfolio',
              subtitle: 'Manage your work and documents',
              onTap: () => context.push(ProfileRoutes.portfolio),
            ),
            OptionTile(
              icon: Icons.language_rounded,
              title: 'Language',
              subtitle: 'Choose your preferred language',
              onTap: () => context.push(ProfileRoutes.language),
            ),
            OptionTile(
              icon: Icons.notifications_none_rounded,
              title: 'Notifications',
              subtitle: 'Control your job alerts',
              onTap: () => context.push(ProfileRoutes.notifications),
            ),
            OptionTile(
              icon: Icons.security_outlined,
              title: 'Login & security',
              subtitle: 'Protect your account and sign-in details',
              onTap: () => context.push(ProfileRoutes.security),
            ),
            OptionTile(
              icon: Icons.assignment_outlined,
              title: 'Complete profile',
              subtitle: 'Add education and work experience',
              onTap: () => context.push(ProfileRoutes.complete),
            ),
            const SizedBox(height: 24),
            const SectionTitle('Support'),
            const SizedBox(height: 8),
            OptionTile(
              icon: Icons.help_outline_rounded,
              title: 'Help center',
              subtitle: 'Find answers to common questions',
              onTap: () => context.push(ProfileRoutes.help),
            ),
            OptionTile(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy policy',
              subtitle: 'Review how your data is handled',
              onTap: () => context.push(ProfileRoutes.privacy),
            ),
            OptionTile(
              icon: Icons.description_outlined,
              title: 'Terms and conditions',
              subtitle: 'Read the app terms',
              onTap: () => context.push(ProfileRoutes.terms),
            ),
          ],
        ),
      ),
    );
  }
}

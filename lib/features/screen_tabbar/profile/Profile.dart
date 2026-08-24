import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/core/util/app_style.dart';

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
            _ProfileHeader(),
            const SizedBox(height: 28),
            const _SectionTitle('General'),
            const SizedBox(height: 8),
            _OptionTile(
              icon: Icons.person_outline_rounded,
              title: 'Edit profile',
              subtitle: 'Update your personal information',
              onTap: () => context.push(ProfileRoutes.edit),
            ),
            _OptionTile(
              icon: Icons.folder_open_outlined,
              title: 'Portfolio',
              subtitle: 'Manage your work and documents',
              onTap: () => context.push(ProfileRoutes.portfolio),
            ),
            _OptionTile(
              icon: Icons.language_rounded,
              title: 'Language',
              subtitle: 'Choose your preferred language',
              onTap: () => context.push(ProfileRoutes.language),
            ),
            _OptionTile(
              icon: Icons.notifications_none_rounded,
              title: 'Notifications',
              subtitle: 'Control your job alerts',
              onTap: () => context.push(ProfileRoutes.notifications),
            ),
            _OptionTile(
              icon: Icons.security_outlined,
              title: 'Login & security',
              subtitle: 'Protect your account and sign-in details',
              onTap: () => context.push(ProfileRoutes.security),
            ),
            _OptionTile(
              icon: Icons.assignment_outlined,
              title: 'Complete profile',
              subtitle: 'Add education and work experience',
              onTap: () => context.push(ProfileRoutes.complete),
            ),
            const SizedBox(height: 24),
            const _SectionTitle('Support'),
            const SizedBox(height: 8),
            _OptionTile(
              icon: Icons.help_outline_rounded,
              title: 'Help center',
              subtitle: 'Find answers to common questions',
              onTap: () => context.push(ProfileRoutes.help),
            ),
            _OptionTile(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy policy',
              subtitle: 'Review how your data is handled',
              onTap: () => context.push(ProfileRoutes.privacy),
            ),
            _OptionTile(
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

abstract class ProfileRoutes {
  static const edit = '/profile/edit';
  static const portfolio = '/profile/portfolio';
  static const language = '/profile/language';
  static const notifications = '/profile/notifications';
  static const security = '/profile/security';
  static const complete = '/profile/complete';
  static const education = '/profile/education';
  static const experience = '/profile/experience';
  static const help = '/profile/help';
  static const privacy = '/profile/privacy';
  static const terms = '/profile/terms';
}

class ProfileOptionPage extends StatelessWidget {
  const ProfileOptionPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title is ready to be configured.')),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

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

class _OptionTile extends StatelessWidget {
  const _OptionTile({
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
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.primary700),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}

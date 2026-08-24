import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class LOginAndSecurity extends StatelessWidget {
  const LOginAndSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login & security'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary900,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.shield_outlined, color: Colors.white, size: 34),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Keep your account secure',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const _SecuritySectionTitle('Account access'),
          _SecurityTile(
            icon: Icons.email_outlined,
            title: 'Email address',
            subtitle: 'Manage the email used to sign in',
            onTap: () => _showUnavailable(context, 'Email address'),
          ),
          _SecurityTile(
            icon: Icons.phone_outlined,
            title: 'Phone number',
            subtitle: 'Add or update your phone number',
            onTap: () => _showUnavailable(context, 'Phone number'),
          ),
          _SecurityTile(
            icon: Icons.lock_outline_rounded,
            title: 'Change password',
            subtitle: 'Use a strong password for your account',
            onTap: () => _showUnavailable(context, 'Change password'),
          ),
          const SizedBox(height: 24),
          const _SecuritySectionTitle('Extra protection'),
          _SecurityTile(
            icon: Icons.verified_user_outlined,
            title: 'Two-step verification',
            subtitle: 'Add another layer of sign-in protection',
            onTap: () => _showUnavailable(context, 'Two-step verification'),
          ),
          _SecurityTile(
            icon: Icons.face_retouching_natural,
            title: 'Face ID',
            subtitle: 'Use device biometrics when available',
            trailing: Switch.adaptive(value: false, onChanged: (_) {}),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void _showUnavailable(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$title settings will be available soon.')),
    );
  }
}

class _SecuritySectionTitle extends StatelessWidget {
  const _SecuritySectionTitle(this.title);

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

class _SecurityTile extends StatelessWidget {
  const _SecurityTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Icon(icon, color: AppColors.primary600),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: trailing ?? const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}

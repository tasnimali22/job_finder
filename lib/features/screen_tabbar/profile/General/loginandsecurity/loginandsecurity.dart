import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/general/widgets/security_section_title.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/general/widgets/security_tile.dart';

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
          const SecuritySectionTitle('Account access'),
          SecurityTile(
            icon: Icons.email_outlined,
            title: 'Email address',
            subtitle: 'Manage the email used to sign in',
            onTap: () => _showUnavailable(context, 'Email address'),
          ),
          SecurityTile(
            icon: Icons.phone_outlined,
            title: 'Phone number',
            subtitle: 'Add or update your phone number',
            onTap: () => _showUnavailable(context, 'Phone number'),
          ),
          SecurityTile(
            icon: Icons.lock_outline_rounded,
            title: 'Change password',
            subtitle: 'Use a strong password for your account',
            onTap: () => _showUnavailable(context, 'Change password'),
          ),
          const SizedBox(height: 24),
          const SecuritySectionTitle('Extra protection'),
          SecurityTile(
            icon: Icons.verified_user_outlined,
            title: 'Two-step verification',
            subtitle: 'Add another layer of sign-in protection',
            onTap: () => _showUnavailable(context, 'Two-step verification'),
          ),
          SecurityTile(
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

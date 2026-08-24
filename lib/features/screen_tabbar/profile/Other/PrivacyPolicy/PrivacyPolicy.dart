import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class PrivacePolocy extends StatelessWidget {
  const PrivacePolocy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: const [
          _PrivacyIntro(),
          SizedBox(height: 24),
          _PrivacySection(
            title: 'Information we collect',
            text:
                'We collect the information you provide when creating your account, completing your profile, and applying for jobs. This may include your name, contact details, CV, portfolio, and work history.',
          ),
          _PrivacySection(
            title: 'How we use your information',
            text:
                'Your information helps us show relevant opportunities, submit applications, maintain your profile, and provide support. We only use it for the purposes needed to operate and improve Jobsque.',
          ),
          _PrivacySection(
            title: 'Data sharing',
            text:
                'When you apply for a job, the information you choose to submit is shared with the relevant employer. We do not sell your personal information to advertisers.',
          ),
          _PrivacySection(
            title: 'Your choices',
            text:
                'You can review and update your profile information at any time. You may also contact support to ask about accessing, correcting, or deleting your personal data, subject to applicable requirements.',
          ),
          _PrivacySection(
            title: 'Keeping your data secure',
            text:
                'We use reasonable technical and organizational measures to protect your information. Please keep your password private and contact us promptly if you suspect unauthorized access.',
          ),
        ],
      ),
    );
  }
}

class _PrivacyIntro extends StatelessWidget {
  const _PrivacyIntro();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lock_outline_rounded, color: Colors.white, size: 30),
          SizedBox(height: 16),
          Text(
            'Your privacy matters',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Here is how Jobsque handles your information.',
            style: TextStyle(color: AppColors.primary100, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _PrivacySection extends StatelessWidget {
  const _PrivacySection({required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 7),
          Text(
            text,
            style: const TextStyle(color: AppColors.neutral600, height: 1.55),
          ),
        ],
      ),
    );
  }
}

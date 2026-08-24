import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: const [
          _Intro(),
          SizedBox(height: 24),
          _TermsSection(
            number: '01',
            title: 'Using Jobsque',
            text:
                'Jobsque helps job seekers discover opportunities and manage their applications. You agree to provide accurate information and use the app for lawful employment-related purposes.',
          ),
          _TermsSection(
            number: '02',
            title: 'Your account',
            text:
                'Keep your account details private and notify us if you notice unauthorized activity. You are responsible for the information and documents you add to your profile.',
          ),
          _TermsSection(
            number: '03',
            title: 'Job applications',
            text:
                'Job listings are provided by employers and may change or expire. Jobsque does not guarantee an interview, an offer, or the accuracy of information supplied by a third party.',
          ),
          _TermsSection(
            number: '04',
            title: 'Content and privacy',
            text:
                'Only upload content you have permission to share. We process your information to provide the service, improve your experience, and support your applications according to our Privacy Policy.',
          ),
          _TermsSection(
            number: '05',
            title: 'Changes to these terms',
            text:
                'We may update these terms when the service changes. The latest version will always be available on this page, and continued use of Jobsque means you accept the updated terms.',
          ),
        ],
      ),
    );
  }
}

class _Intro extends StatelessWidget {
  const _Intro();

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
          Icon(Icons.verified_user_outlined, color: Colors.white, size: 30),
          SizedBox(height: 16),
          Text(
            'A clear agreement',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please read these terms before using Jobsque.',
            style: TextStyle(color: AppColors.primary100, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _TermsSection extends StatelessWidget {
  const _TermsSection({
    required this.number,
    required this.title,
    required this.text,
  });

  final String number;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(
              color: AppColors.primary500,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.neutral600,
                    height: 1.55,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/widget/privacy_section.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/widget/privacyintro.dart';

class PrivacePolocy extends StatelessWidget {
  const PrivacePolocy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: const [
          PrivacyIntro(),
          SizedBox(height: 24),
          PrivacySection(
            title: 'Information we collect',
            text:
                'We collect the information you provide when creating your account, completing your profile, and applying for jobs. This may include your name, contact details, CV, portfolio, and work history.',
          ),
          PrivacySection(
            title: 'How we use your information',
            text:
                'Your information helps us show relevant opportunities, submit applications, maintain your profile, and provide support. We only use it for the purposes needed to operate and improve Jobsque.',
          ),
          PrivacySection(
            title: 'Data sharing',
            text:
                'When you apply for a job, the information you choose to submit is shared with the relevant employer. We do not sell your personal information to advertisers.',
          ),
          PrivacySection(
            title: 'Your choices',
            text:
                'You can review and update your profile information at any time. You may also contact support to ask about accessing, correcting, or deleting your personal data, subject to applicable requirements.',
          ),
          PrivacySection(
            title: 'Keeping your data secure',
            text:
                'We use reasonable technical and organizational measures to protect your information. Please keep your password private and contact us promptly if you suspect unauthorized access.',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/widget/intro.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/widget/teamsection.dart';

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
          Intro(),
          SizedBox(height: 24),
          TermsSection(
            number: '01',
            title: 'Using Jobsque',
            text:
                'Jobsque helps job seekers discover opportunities and manage their applications. You agree to provide accurate information and use the app for lawful employment-related purposes.',
          ),
          TermsSection(
            number: '02',
            title: 'Your account',
            text:
                'Keep your account details private and notify us if you notice unauthorized activity. You are responsible for the information and documents you add to your profile.',
          ),
          TermsSection(
            number: '03',
            title: 'Job applications',
            text:
                'Job listings are provided by employers and may change or expire. Jobsque does not guarantee an interview, an offer, or the accuracy of information supplied by a third party.',
          ),
          TermsSection(
            number: '04',
            title: 'Content and privacy',
            text:
                'Only upload content you have permission to share. We process your information to provide the service, improve your experience, and support your applications according to our Privacy Policy.',
          ),
          TermsSection(
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

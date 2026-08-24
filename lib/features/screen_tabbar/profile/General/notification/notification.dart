import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class Natification extends StatefulWidget {
  const Natification({super.key});

  @override
  State<Natification> createState() => _NatificationState();
}

class _NatificationState extends State<Natification> {
  final Map<String, bool> _settings = {
    'Job search alerts': true,
    'Application updates': true,
    'Application reminders': true,
    'Recommended jobs': true,
    'Jobsque updates': true,
    'Profile visibility': true,
    'Messages': true,
    'Message nudges': true,
  };

  void _toggle(String title, bool value) {
    setState(() => _settings[title] = value);
  }

  Widget _section(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.neutral600,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        ...items.map(
          (item) => SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            title: Text(item),
            value: _settings[item] ?? false,
            activeColor: AppColors.primary500,
            onChanged: (value) => _toggle(item, value),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          const Text(
            'Choose which updates you want to receive.',
            style: TextStyle(color: AppColors.neutral600, height: 1.5),
          ),
          _section('Job notifications', [
            'Job search alerts',
            'Application updates',
            'Application reminders',
            'Recommended jobs',
            'Jobsque updates',
          ]),
          _section('Other notifications', [
            'Profile visibility',
            'Messages',
            'Message nudges',
          ]),
        ],
      ),
    );
  }
}

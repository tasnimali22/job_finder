import 'package:flutter/material.dart';

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

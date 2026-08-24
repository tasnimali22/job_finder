import 'package:flutter/material.dart';
import 'package:jobs_que_app/features/onboarding/presentation/view/introduction_one.dart';
import 'package:jobs_que_app/features/onboarding/presentation/view/introduction_there.dart';
import 'package:jobs_que_app/features/onboarding/presentation/view/introduction_two.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  late final PageController controller;
  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: PageView(
          controller: controller,
          children: [
            IntroductionOne(controller: controller),
            IntroductionTwo(controller: controller),
            IntroductionThere(controller: controller),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/util/asset_image.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    naveigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    naveigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Image.asset(AssetImageData.splash, fit: BoxFit.contain)],
    );
  }

  void naveigateToHome() {
    Future.delayed(const Duration(milliseconds: 350), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push(AppRouter.kintroduction);
    });
  }
}

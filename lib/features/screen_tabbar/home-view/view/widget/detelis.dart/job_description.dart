import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/model/all_job_model.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/detelis.dart/custom_default_tab_controller.dart';

class JobDescription extends StatelessWidget {
  const JobDescription({super.key, required this.detelis});
  final AllJobModel detelis;

  @override
  Widget build(BuildContext context) {
    final detelis = GoRouterState.of(context).extra as AllJobModel;
    return Scaffold(body: CustomDefaultTabController(details: detelis));
  }
}

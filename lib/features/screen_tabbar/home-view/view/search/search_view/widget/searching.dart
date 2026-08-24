import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/search_view/widget/custom_search.dart';

class Searching extends StatelessWidget {
  const Searching({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSearch);
      },
      child: AbsorbPointer(child: CustomSearch(text: 'Search')),
    );
  }
}

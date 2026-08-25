import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/view/show_apply.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/data/show_apply_cubit/show_apply_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/home_body.dart';
import 'package:jobs_que_app/features/screen_tabbar/message_view/view/massage_view.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/profile.dart';
import 'package:jobs_que_app/features/screen_tabbar/saved_view/saved.dart';

class BottomNavigaterBar extends StatefulWidget {
  const BottomNavigaterBar({super.key});

  @override
  State<BottomNavigaterBar> createState() => _BottomNavigaterBarState();
}

class _BottomNavigaterBarState extends State<BottomNavigaterBar> {
  int currectindex = 0;
  List<Widget> widgets = [
    const HomeBody(),
    const MassageView(),
    const ShowApply(),
    const SavedView(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currectindex,
        onTap: (index) {
          setState(() {
            currectindex = index;
          });
          if (index == 2) {
            context.read<ShowApplyCubit>().applyJob();
          }
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.transparent,
        unselectedLabelStyle: AppTextStyles.textXSRegularn,
        selectedLabelStyle: AppTextStyles.textXSMediump,
        elevation: 0,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: AppColors.neutral400),
            label: "Home",
            activeIcon: Icon(Icons.home_filled, color: AppColors.primary500),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.messenger_outline_rounded,
              color: AppColors.neutral400,
            ),
            label: "massage",
            activeIcon: Icon(
              Icons.messenger_outlined,
              color: AppColors.primary500,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline_rounded, color: AppColors.neutral400),
            label: "Applied",
            activeIcon: Icon(Icons.work, color: AppColors.primary500),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border_rounded,
              color: AppColors.neutral400,
            ),
            label: "Saved",
            activeIcon: Icon(
              Icons.bookmark_outlined,
              color: AppColors.primary500,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_outlined,
              color: AppColors.neutral400,
            ),
            label: "profile",
            activeIcon: Icon(Icons.person, color: AppColors.primary500),
          ),
        ],
      ),
      body: IndexedStack(index: currectindex, children: widgets),
    );
  }
}

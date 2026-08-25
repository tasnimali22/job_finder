import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/widgets/custom_circle_indicator.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/data/searchcubit/search_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/data/searchcubit/search_state.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/search_view/widget/custom_search.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 58.h, right: 12.w, left: 12.w),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (BuildContext context, SearchState state) {
            return Column(
              children: [
                CustomSearch(
                  controller: context.read<SearchCubit>().searchController,
                  text: "type something",
                  onSubmitted: (p0) {
                    if (p0.trim().isNotEmpty) {
                      context.read<SearchCubit>().search(jobName: p0);
                    }
                  },
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (state is SearchSuccessState) {
                        return ListView.builder(
                          itemCount: state.searchmodel.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              onTap: () {
                                context.read<SearchCubit>().search(
                                  jobName: state.searchmodel[index].name ?? "",
                                );
                                GoRouter.of(
                                  context,
                                ).push(AppRouter.kDetailsSearch);
                              },
                              leading: const Icon(
                                Icons.settings_backup_restore_outlined,
                                color: AppColors.neutral400,
                              ),
                              title: Text(state.searchmodel[index].name ?? ""),
                              trailing: const Icon(
                                Icons.arrow_circle_right_outlined,
                                color: AppColors.information600,
                              ),
                            );
                          },
                        );
                      } else if (state is SearchFalidedState) {
                        return const Text("not Found");
                      } else {
                        return const CustomCircleIndicator();
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

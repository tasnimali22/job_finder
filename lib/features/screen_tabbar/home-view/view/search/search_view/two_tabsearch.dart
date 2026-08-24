import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/widgets/custom_circle_indicator.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/data/searchcubit/search_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/data/searchcubit/search_state.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/all_jobs.dart';
import 'package:jobs_que_app/features/screen_tabbar/saved_view/data/cubit/saved_cubit.dart';

class CustomSearchList extends StatelessWidget {
  const CustomSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search results')),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (BuildContext context, state) {
          if (state is SearchSuccessState) {
            if (state.searchmodel.isEmpty) {
              return const Center(child: Text('No jobs found'));
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: state.searchmodel.length,
              itemBuilder: (BuildContext context, int index) {
                final item = state.searchmodel[index];
                final itemId = item.id?.toString() ?? '';
                final isSaved = context.watch<SavedCubit>().savedJob.contains(
                  itemId,
                );
                return InkWell(
                  onTap: () => context.push(AppRouter.kDetails, extra: item),
                  child: AllJobs(
                    image: item.image ?? '',
                    nameJob: item.name ?? '',
                    compname: item.compName ?? '',
                    location: item.location ?? '',
                    salary: item.salary ?? '',
                    isSaved: isSaved,
                    onSavedPressed: () =>
                        context.read<SavedCubit>().saved(itemId),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Divider(thickness: 1, indent: 16, endIndent: 16),
            );
          }
          if (state is SearchFalidedState) {
            return Center(child: Text(state.errMessage));
          }
          return const Center(child: CustomCircleIndicator());
        },
      ),
    );
  }
}

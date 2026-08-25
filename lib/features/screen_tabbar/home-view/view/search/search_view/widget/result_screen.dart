import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que_app/core/widgets/custom_circle_indicator.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/data/searchcubit/search_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/data/searchcubit/search_state.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/all_jobs.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (BuildContext context, SearchState state) {
          if (state is SearchSuccessState) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return AllJobs(
                  image: state.searchmodel[index].image ?? "",
                  nameJob: state.searchmodel[index].name ?? "",
                  compname: state.searchmodel[index].compName ?? "",
                  location: state.searchmodel[index].location ?? "",
                  salary: state.searchmodel[index].salary ?? "",
                  isSaved: false,
                  onSavedPressed: () {},
                );
              },
            );
          } else if (state is SearchFalidedState) {
            return Text(state.errMessage);
          } else {
            return const CustomCircleIndicator();
          }
        },
      ),
    );
  }
}

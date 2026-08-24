import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que_app/core/util/api_services.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/data/model/search_model.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/data/searchcubit/search_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(InitalState());
  final TextEditingController searchController = TextEditingController();

  Future<void> search({required String jobName}) async {
    final prefs = await SharedPreferences.getInstance();
    String? saveToken = prefs.getString("token");
    try {
      emit(SearchLoadingstate());
      var response = await Api().post(
        url: "/jobs/search",
        body: {"name": jobName},
        token: saveToken,
      );
      List<SearchModel> searchResults = [];
      List<dynamic> data = response['data'] ?? [];

      for (var item in data) {
        searchResults.add(SearchModel.fromJson(item));
      }
      emit(SearchSuccessState(searchmodel: searchResults));
    } catch (e) {
      print("$e");
      emit(SearchFalidedState(errMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}

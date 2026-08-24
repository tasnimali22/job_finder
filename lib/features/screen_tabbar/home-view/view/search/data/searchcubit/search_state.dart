import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/data/model/search_model.dart';

class SearchState {}

class InitalState extends SearchState {}

class SearchLoadingstate extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<SearchModel> searchmodel;

  SearchSuccessState({required this.searchmodel});
}

class SearchFalidedState extends SearchState {
  final String errMessage;

  SearchFalidedState({required this.errMessage});
}

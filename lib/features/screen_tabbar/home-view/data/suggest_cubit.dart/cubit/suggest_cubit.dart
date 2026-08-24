import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que_app/core/util/api_services.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/model/suggest_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'suggest_state.dart';

class SuggestCubit extends Cubit<SuggestState> {
  SuggestCubit() : super(SuggestInitial());
  Future<void> alljob() async {
    final prefs = await SharedPreferences.getInstance();
    String? saveToken = prefs.getString("token");
    final List<SuggestJobModel> item = [];
    try {
      emit(SuggestLoading());
      var response = await Api().get(
        url: '/jobs/',
        token: saveToken ?? "token not found",
      );
      List<dynamic> items = response["data"];
      for (int i = 0; i < items.length; i++) {
        item.add(SuggestJobModel.fromJson(items[i]));
      }
      emit(SuggestSuccess(suggest: item));
    } on Exception catch (e) {
      emit(SuggestFailure(errMassage: e.toString()));
    }
  }
}

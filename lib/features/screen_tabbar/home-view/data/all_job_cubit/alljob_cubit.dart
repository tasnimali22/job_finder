import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que_app/core/util/api_services.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/all_job_cubit/all_job_state.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/model/all_job_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllJobCubit extends Cubit<AllJobState> {
  AllJobCubit() : super(AllJobInitial());
  final List<AllJobModel> item = [];
  Future<void> alljob() async {
    final prefs = await SharedPreferences.getInstance();
    String? saveToken = prefs.getString("token");
    try {
      emit(AllJobLoading());
      item.clear();
      var response = await Api().get(
        url: '/jobs/',
        token: saveToken ?? "token not found",
      );
      List<dynamic> items = response["data"];
      for (int i = 0; i < items.length; i++) {
        item.add(AllJobModel.fromJson(items[i]));
      }
      emit(AllJobSuccess(items: item));
    } on Exception catch (e) {
      emit(AllJobFailure(errMessage: e.toString()));
    }
  }
}

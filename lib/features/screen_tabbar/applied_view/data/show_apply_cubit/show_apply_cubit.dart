import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que_app/core/util/api_services.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/data/models/showapply_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'show_apply_state.dart';

class ShowApplyCubit extends Cubit<ShowApplyState> {
  ShowApplyCubit() : super(ShowApplyInitial());
  Future<void> applyJob() async {
    final prefs = await SharedPreferences.getInstance();
    final saveToken = prefs.getString("token") ?? '';
    final userId = prefs.getInt("user_id");
    final List<ShowApplayModel> item = [];
    try {
      emit(ShowApplyLoading());
      if (userId == null) {
        emit(ShowApplySuccess(model: []));
        return;
      }
      var response = await Api().get(url: '/apply/$userId', token: saveToken);
      List<dynamic> models = response["data"];
      for (int i = 0; i < models.length; i++) {
        item.add(ShowApplayModel.fromJson(models[i]));
      }
      emit(ShowApplySuccess(model: item));
    } on Exception {
      emit(ShowApplyFailure(errMassage: "there was an error"));
    }
  }
}

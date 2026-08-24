import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que_app/core/util/api_services.dart';
import 'package:jobs_que_app/features/screen_tabbar/message_view/data/model/get_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'get_cubit_state.dart';

class GetCubitCubit extends Cubit<GetCubitState> {
  GetCubitCubit() : super(GetCubitInitial());
  List<GetMessageModel> massage = [];
  Future<void> getChat() async {
    final prefs = await SharedPreferences.getInstance();
    String? saveToken = prefs.getString("token");
    try {
      emit(GetMessageLoading());
      var response = await Api().get(
        url: '/chat?user_id=1&comp_id=1',
        token: saveToken ?? '',
      );
      massage.clear();
      for (var doc in response['data']) {
        massage.add(GetMessageModel.fromJson(doc));
      }
      emit(GetMessageSuccess(massages: List.from(massage)));
    } on Exception {
      emit(GetMessageFailure(errMassage: "there was an error"));
    }
  }

  void sendMassage({required String massage}) async {
    final prefs = await SharedPreferences.getInstance();
    String? saveToken = prefs.getString("token");

    try {
      emit(SendMessageLoading());
      await Api().post(
        url: "/chat/company?user_id=1&comp_id=1",
        body: {"massage": massage},
        token: saveToken,
      );
      emit(SendMessageSuccess());
    } catch (e) {
      emit(SendMessageFailure());
    }
  }
}

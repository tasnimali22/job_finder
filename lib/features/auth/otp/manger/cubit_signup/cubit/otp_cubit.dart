import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que_app/core/util/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpTimerState> {
  OtpCubit() : super(OtpTimerInitial());
  String? otp = "";

  Future<void> verifyCode({required String email}) async {
    final prefs = await SharedPreferences.getInstance();
    String? saveToken = prefs.getString("token");
    emit(OtpTimerLoading());
    try {
      // ignore: unused_local_variable
      var response = await Api().post(
        url: "/auth/otp",
        body: {"email": email, "otp": otp},
        token: saveToken,
      );
      emit(OtpTimerSucess());
    } on Exception catch (e) {
      emit(OtpTimerFailre(errMessage: e.toString()));
    } catch (e) {
      emit(OtpTimerFailre(errMessage: "there was an error"));
    }
  }
}

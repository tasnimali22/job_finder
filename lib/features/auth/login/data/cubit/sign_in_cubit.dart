import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que_app/core/util/api_services.dart';
import 'package:jobs_que_app/features/auth/login/data/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_in_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  Future<void> signIn() async {
    final prefs = await SharedPreferences.getInstance();
    String? saveToken = prefs.getString("token");
    try {
      emit(SigninLoading());

      final response = await Api().post(
        url: '/auth/login',
        body: {
          "name": emailController.text.trim(),
          "password": passwordController.text.trim(),
        },
        token: saveToken,
      );
      final loginModel = LoginModel.fromJson(response);
      if (loginModel.token != null) {
        await prefs.setString("token", loginModel.token!);
      }
      if (loginModel.user?.id != null) {
        await prefs.setInt("user_id", loginModel.user!.id!);
      }
      final name = loginModel.user?.name ?? prefs.getString("user_name") ?? "";
      await prefs.setString("user_name", name);
      emit(SigninSuccess(name));
    } catch (e) {
      emit(SigninFailure("there was an error"));
    }
  }
}

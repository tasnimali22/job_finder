import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que_app/core/util/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Future<void> signUp() async {
    try {
      emit(SignUpLoading());

      final response = await Api().post(
        url: '/auth/register',
        body: {
          "name": nameController.text.trim(),
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        },
        token: null,
      );
      String token = response["token"];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);
      await prefs.setString("user_name", nameController.text.trim());
      final userId = response["user"]?["id"];
      if (userId is int) {
        await prefs.setInt("user_id", userId);
      }

      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailre(errMessage: "there was an error"));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    return super.close();
  }
}

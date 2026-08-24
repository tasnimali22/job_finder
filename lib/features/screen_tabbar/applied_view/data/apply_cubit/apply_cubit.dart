import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que_app/core/util/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'apply_state.dart';

class ApplyCubit extends Cubit<ApplyState> {
  ApplyCubit({this.jobId}) : super(ApplyInitial());
  final int? jobId;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  Future<void> applyJob({required File cvFile, required File otherFile}) async {
    final prefs = await SharedPreferences.getInstance();
    String? saveToken = prefs.getString("token");
    final userId = prefs.getInt("user_id");
    try {
      emit(ApplyLoading());
      await Api().postWithFiles(
        url: '/apply',
        body: {
          "name": nameController.text.trim(),
          "email": emailController.text.trim(),
          "mobile": phoneController.text.trim(),
          "work_type": "full time",
          "jobs_id": jobId?.toString() ?? "1",
          "user_id": userId?.toString() ?? "",
        },
        files: [
          await http.MultipartFile.fromPath("cv_file", cvFile.path),
          await http.MultipartFile.fromPath("other_file", otherFile.path),
        ],
        token: saveToken,
      );
      emit(ApplySuccess());
    } on Exception catch (e) {
      emit(ApplyFailure(errMessage: e.toString()));
    }
  }
}

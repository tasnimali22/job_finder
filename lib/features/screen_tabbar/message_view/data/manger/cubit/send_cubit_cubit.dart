// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jobs_que_app/core/util/api_services.dart';
// import 'package:jobs_que_app/features/screen_tabbar/message_view/data/model/company_send_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// part 'send_cubit_state.dart';

// class SendCubitCubit extends Cubit<SendCubitState> {
//   SendCubitCubit() : super(SendCubitInitial());

//   void sendMassage({required String massage}) async {
//     final prefs = await SharedPreferences.getInstance();
//     String? saveToken = prefs.getString("token");

//     try {
//       emit(SendMessageLoading());
//       await Api().post(
//         url: "/chat/company?massage=hsjhsj&user_id=1&comp_id=1",
//         body: {"massage": massage},
//         token: saveToken,
//       );
//       emit(SendMessageSuccess());
//     } catch (e) {
//       emit(SendMessageFailure());
//     }
//   }
// }

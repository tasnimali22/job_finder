import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/features/screen_tabbar/message_view/data/model/get_message.dart';

class Chatbuble extends StatelessWidget {
  const Chatbuble({super.key, required this.message});

  final GetMessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppColors.primary500,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: Text(
          message.massage ?? "",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

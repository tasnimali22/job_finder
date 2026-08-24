import 'package:flutter/material.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/features/screen_tabbar/message_view/data/model/get_message.dart';

class ChatbubleForfrind extends StatelessWidget {
  const ChatbubleForfrind({super.key, required this.message});

  final GetMessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        margin: const EdgeInsets.fromLTRB(48, 4, 8, 4),
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
          color: AppColors.neutral200,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
          ),
        ),
        child: Text(
          message.massage ?? '',
          style: const TextStyle(color: AppColors.neutral800),
        ),
      ),
    );
  }
}

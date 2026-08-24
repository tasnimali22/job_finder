import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/core/util/app_style.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
    this.onSubmitted,
    required this.text,
    this.controller,
  });

  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintStyle: AppTextStyles.textMRegularn,
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
        disabledBorder: OutlineInputBorder(),
        hintText: text,
        prefixIcon: Icon(Icons.search),

        focusedBorder: outLineInput(),

        enabledBorder: outLineInput(),
        border: outLineInput(),
      ),
    );
  }

  OutlineInputBorder outLineInput() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(27.r),
      borderSide: BorderSide(color: AppColors.neutral300),
    );
  }
}

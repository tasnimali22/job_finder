import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.controller,
    this.validator,
    this.title,
    this.obscureText,
    required this.hint,
    this.keyboard,
    this.prefixIcon,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? title;
  final String hint;
  final TextInputType? keyboard;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.neutral400, width: 1),
    );
    return Padding(
      padding: EdgeInsets.only(
        top: 16.h,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: TextFormField(
        obscureText: obscureText ?? false,
        keyboardType: keyboard,
        validator: validator,
        controller: controller,
        // enabled: false,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          // errorStyle: TextStyle(color: Colors.white)
          // label: Text(title!, style: TextStyle(color: Color(0xFF3F80FF))),
          focusColor: Colors.white,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,

          fillColor: AppColors.danger100,
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.neutral400),
          enabledBorder: outlineInputBorder,

          focusedBorder: outlineInputBorder.copyWith(
            borderSide: BorderSide(color: AppColors.primary400),
          ),
        ),
      ),
    );
  }
}

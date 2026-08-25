import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/features/auth/create_account/view/widget/custom_text_filed.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/data/apply_cubit/apply_cubit.dart';

class FormApplyedJob extends StatelessWidget {
  const FormApplyedJob({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text("Full Name", style: AppTextStyles.textLRegular),
          CustomTextFiled(
            prefixIcon: const Icon(Icons.person_outline_rounded),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your name";
              }
              return null;
            },
            controller: context.read<ApplyCubit>().nameController,
            hint: 'full name',
          ),
          SizedBox(height: 20.h),

          Text("Email", style: AppTextStyles.textLRegular),

          CustomTextFiled(
            prefixIcon: const Icon(Icons.email_outlined),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your email";
              } else if (!value.contains('@')) {
                return "Please enter a valid email";
              }
              return null;
            },
            controller: context.read<ApplyCubit>().emailController,
            hint: 'you@gmail.com',
          ),
          SizedBox(height: 20.h),

          Text("No Handphone", style: AppTextStyles.textLRegular),
          SizedBox(height: 20.h),

          IntlPhoneField(
            decoration: InputDecoration(
              hintText: "100-000-4587",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.primary400),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.neutral300),
              ),
            ),
            controller: context.read<ApplyCubit>().phoneController,
            initialCountryCode: "EG",
            onChanged: (value) {
              value.completeNumber;
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_style.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    required this.text,
    this.onPressed,
    this.emailController,
    this.passwordController,
    //  required GlobalKey<FormState> formKey
  });

  final TextEditingController? emailController;
  final String text;
  final void Function()? onPressed;
  final TextEditingController? passwordController;
  // final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        color: Color(0xFF3F80FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: onPressed,
        //   Services().signInView(
        //     emailController: emailController,
        //     passwordController: passwordController,
        //     context: context,
        //   );
        //   if (formKey.currentState!.validate()) {
        //     log(
        //       "Email: ${emailController.text}, Password: ${passwordController.text}",
        //     );
        //   }
        // },
        child: Text(text, style: AppTextStyles.textLMediumW),
      ),
    );
  }
}

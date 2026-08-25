import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que_app/features/auth/create_account/view/widget/custom_text_filed.dart';
import 'package:jobs_que_app/features/auth/login/data/cubit/sign_in_cubit.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
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
            controller: context.read<SigninCubit>().emailController,
            hint: 'you@gmail.com',
          ),

          CustomTextFiled(
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password must be at least 8 characters";
              } else if (value.length < 8) {
                return "Password must be at least 8 characters";
              }
              return null;
            },
            prefixIcon: const Icon(Icons.lock_outlined),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_moderator_outlined),
            ),
            controller: context.read<SigninCubit>().passwordController,
            hint: "Password",
          ),
        ],
      ),
    );
  }
}

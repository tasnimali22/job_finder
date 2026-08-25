import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que_app/features/auth/create_account/data/cubit/sign_up_cubit.dart';
import 'package:jobs_que_app/features/auth/create_account/view/widget/custom_text_filed.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFiled(
            prefixIcon: const Icon(Icons.person_outline_rounded),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your name";
              }
              return null;
            },
            controller: context.read<SignUpCubit>().nameController,
            hint: 'user name',
          ),

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
            controller: context.read<SignUpCubit>().emailController,
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
            controller: context.read<SignUpCubit>().passwordController,
            hint: "Password",
          ),
        ],
      ),
    );
  }
}

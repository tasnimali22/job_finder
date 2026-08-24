import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/core/widgets/custom_appbarview.dart';
import 'package:jobs_que_app/core/widgets/custom_button.dart';
import 'package:jobs_que_app/features/auth/create_account/data/cubit/sign_up_cubit.dart';
import 'package:jobs_que_app/features/auth/create_account/view/widget/formsignup.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class CreateAccount extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: BlocBuilder<SignUpCubit, SignUpState>(
              builder: (BuildContext context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBarView(),
                    Text(
                      "Cereate Account",
                      style: AppTextStyles.heading2Medium,
                    ),
                    Text(
                      "Please create an account to find your dream job",
                      style: AppTextStyles.textLRegularN,
                    ),
                    SizedBox(height: 58.h),

                    FormSignUp(formKey: formKey),

                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: AppTextStyles.textMMediumn,
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.kLogin);
                          },
                          child: Text(
                            "Login",
                            style: AppTextStyles.textMMediump,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.only(bottom: 40.h, left: 24.w, right: 24.w),
        child: CustomBotton(
          text: "create account",
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              final signUpCubit = context.read<SignUpCubit>();
              await signUpCubit.signUp();

              GoRouter.of(context).push(
                AppRouter.kHome,
                extra: context.read<SignUpCubit>().nameController,
              );
            }
          },
        ),
      ),
    );
  }
}

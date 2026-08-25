import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/core/widgets/custom_appbarview.dart';
import 'package:jobs_que_app/core/widgets/custom_button.dart';
import 'package:jobs_que_app/features/auth/login/data/cubit/sign_in_cubit.dart';
import 'package:jobs_que_app/features/auth/login/view/widget/custom_checkbox.dart';
import 'package:jobs_que_app/features/auth/login/view/widget/form_login.dart';

class Login extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          GoRouter.of(context).push(AppRouter.kHome, extra: state.name);
        } else if (state is SigninFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMassage)));
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: BlocBuilder<SigninCubit, SigninState>(
                builder: (BuildContext context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomAppBarView(),
                      Text("Login", style: AppTextStyles.heading2Medium),
                      Text(
                        "Please login to find your dream job",
                        style: AppTextStyles.textLRegularN,
                      ),
                      SizedBox(height: 58.h),

                      FormLogin(formKey: formKey),
                      const CustomCheckBox(),

                      SizedBox(height: 20.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont’t have an account? ",
                            style: AppTextStyles.textMMediumn,
                          ),
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(AppRouter.kSignUp);
                            },
                            child: Text(
                              "Register",
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
          padding: EdgeInsetsGeometry.only(
            bottom: 40.h,
            left: 24.w,
            right: 24.w,
          ),
          child: CustomBotton(
            text: "Login",
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                await context.read<SigninCubit>().signIn();
                // ignore: use_build_context_synchronously
                GoRouter.of(context).push(AppRouter.kHome);
              }
            },
          ),
        ),
      ),
    );
  }
}

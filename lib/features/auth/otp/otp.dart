import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/core/util/app_colors.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/core/util/app_style.dart';
import 'package:jobs_que_app/core/widgets/custom_button.dart';
import 'package:jobs_que_app/features/auth/create_account/data/model/regaster_model.dart';
import 'package:jobs_que_app/features/auth/otp/manger/cubit_signup/cubit/otp_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/custom_appbar_apply.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OtpCubit, OtpTimerState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(right: 24.h, left: 24.h, bottom: 40.h),
            child: Column(
              children: [
                const CustomAppbarapply(text: 'Two-step verification'),

                Text(
                  "Enter the 6 digit code",
                  style: AppTextStyles.textLMedium,
                ),

                const Spacer(),
                Text(
                  "Please confirm your account by entering the authorization code sen to : $email",
                  style: AppTextStyles.textMRegularn,
                ),
                OtpTextField(
                  numberOfFields: 4,
                  borderColor: AppColors.neutral400,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    context.read<OtpCubit>().otp = code;
                    //handle validation or checks here
                  },
                  //runs when every textfield is fillead
                  onSubmit: (String verificationCode) {
                    context.read<OtpCubit>().otp = verificationCode;
                    context.read<OtpCubit>().verifyCode(email: email);

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      },
                    );
                  }, // end onSubmit
                ),
                Text("Resend Code", style: AppTextStyles.textSMediu),

                const Spacer(),
                CustomBotton(
                  text: "Verify Code",
                  onPressed: () {
                    RegasterModel authModel = RegasterModel();
                    context.read<OtpCubit>().verifyCode(email: email);
                    GoRouter.of(
                      context,
                    ).push(AppRouter.kHome, extra: authModel.data?.name ?? "");
                  },
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, OtpTimerState state) {
          if (state is OtpTimerSucess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Otp verified Successfully")),
            );
          } else if (state is OtpTimerFailre) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
                backgroundColor: AppColors.danger700,
              ),
            );
          }
        },
      ),
    );
  }
}

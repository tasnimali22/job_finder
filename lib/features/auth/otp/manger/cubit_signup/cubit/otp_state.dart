part of 'otp_cubit.dart';

@immutable
sealed class OtpTimerState {}

final class OtpTimerInitial extends OtpTimerState {}

final class OtpTimerLoading extends OtpTimerState {}

final class OtpTimerSucess extends OtpTimerState {}

final class OtpTimerFailre extends OtpTimerState {
  final String errMessage;

  OtpTimerFailre({required this.errMessage});
}

part of 'sign_in_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final String name;

  SigninSuccess(this.name);
}

final class SigninFailure extends SigninState {
  final String errMassage;
  SigninFailure(this.errMassage);
}

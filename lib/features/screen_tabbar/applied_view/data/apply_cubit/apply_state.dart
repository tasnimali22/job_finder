part of 'apply_cubit.dart';

@immutable
sealed class ApplyState {}

final class ApplyInitial extends ApplyState {}

final class ApplyLoading extends ApplyState {}

final class ApplySuccess extends ApplyState {}

final class ApplyFailure extends ApplyState {
  final String errMessage;

  ApplyFailure({required this.errMessage});
}

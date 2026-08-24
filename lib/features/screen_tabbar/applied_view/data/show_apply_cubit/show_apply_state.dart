part of 'show_apply_cubit.dart';

@immutable
sealed class ShowApplyState {}

final class ShowApplyInitial extends ShowApplyState {}

final class ShowApplyLoading extends ShowApplyState {}

final class ShowApplySuccess extends ShowApplyState {
  final List<ShowApplayModel> model;

  ShowApplySuccess({required this.model});
}

final class ShowApplyFailure extends ShowApplyState {
  final String errMassage;

  ShowApplyFailure({required this.errMassage});
}

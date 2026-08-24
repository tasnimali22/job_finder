part of 'suggest_cubit.dart';

@immutable
sealed class SuggestState {}

final class SuggestInitial extends SuggestState {}

final class SuggestLoading extends SuggestState {}

final class SuggestSuccess extends SuggestState {
  final List<SuggestJobModel> suggest;

  SuggestSuccess({required this.suggest});
}

final class SuggestFailure extends SuggestState {
  final String errMassage;

  SuggestFailure({required this.errMassage});
}

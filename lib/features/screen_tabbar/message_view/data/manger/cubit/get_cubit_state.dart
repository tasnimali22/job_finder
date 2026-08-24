part of 'get_cubit_cubit.dart';

@immutable
sealed class GetCubitState {}

final class GetCubitInitial extends GetCubitState {}

final class GetMessageLoading extends GetCubitState {}

final class GetMessageSuccess extends GetCubitState {
  final List<GetMessageModel> massages;

  GetMessageSuccess({required this.massages});
}

final class GetMessageFailure extends GetCubitState {
  final String errMassage;

  GetMessageFailure({required this.errMassage});
}

final class SendMessageLoading extends GetCubitState {}

final class SendMessageSuccess extends GetCubitState {}

final class SendMessageFailure extends GetCubitState {}

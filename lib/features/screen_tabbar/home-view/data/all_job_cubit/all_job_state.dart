import 'package:flutter/material.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/model/all_job_model.dart';

@immutable
sealed class AllJobState {}

final class AllJobInitial extends AllJobState {}

final class AllJobLoading extends AllJobState {}

final class AllJobSuccess extends AllJobState {
  final List<AllJobModel> items;

  AllJobSuccess({required this.items});
}

final class AllJobFailure extends AllJobState {
  final String errMessage;

  AllJobFailure({required this.errMessage});
}

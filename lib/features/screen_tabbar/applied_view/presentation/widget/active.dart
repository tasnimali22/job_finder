// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/widget/active_job.dart';
// import 'package:jobs_que_app/features/screen_tabbar/home-view/data/all_job_cubit/all_job_state.dart';
// import 'package:jobs_que_app/features/screen_tabbar/home-view/data/all_job_cubit/alljob_cubit.dart';

// class Active extends StatelessWidget {
//   const Active({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<A, AllJobState>(
//       builder: (context, state) {
//         if (state is AllJobSuccess) {
//           return AppliedJobsScreen(allJobs: state.items);
//         }
//       },
//     );
//   }
// }

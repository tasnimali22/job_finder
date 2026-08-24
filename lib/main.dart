import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_que_app/core/util/app_router.dart';
import 'package:jobs_que_app/features/auth/create_account/data/cubit/sign_up_cubit.dart';
import 'package:jobs_que_app/features/auth/login/data/cubit/sign_in_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/all_job_cubit/alljob_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/suggest_cubit.dart/cubit/suggest_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/data/searchcubit/search_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/saved_view/data/cubit/saved_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/data/show_apply_cubit/show_apply_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/message_view/data/manger/cubit/get_cubit_cubit.dart';

void main() {
  runApp(const JobFinder());
}

class JobFinder extends StatelessWidget {
  const JobFinder({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,

      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => SigninCubit()),
          BlocProvider(
            create: (BuildContext context) => SignUpCubit()..signUp(),
          ),
          BlocProvider(create: (BuildContext context) => SearchCubit()),
          BlocProvider(
            create: (BuildContext context) => AllJobCubit()..alljob(),
          ),
          BlocProvider(
            create: (BuildContext context) => SuggestCubit()..alljob(),
          ),
          BlocProvider(create: (BuildContext context) => SavedCubit()),
          BlocProvider(create: (BuildContext context) => ShowApplyCubit()),
          BlocProvider(
            create: (BuildContext context) => GetCubitCubit()..getChat(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          theme: ThemeData.light(),
        ),
      ),
    );
  }
}

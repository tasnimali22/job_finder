import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_que_app/features/auth/create_account/view/create_account.dart';
import 'package:jobs_que_app/features/auth/login/view/login.dart';
import 'package:jobs_que_app/features/bottomNavatianBar/bottom_navigation_bar.dart';
import 'package:jobs_que_app/features/onboarding/presentation/view/splash.dart';
import 'package:jobs_que_app/features/onboarding/presentation/widget/page_widget.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/data/apply_cubit/apply_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/view/applyed_job_bioata.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/view/applyupploadfile_to_job.dart';
import 'package:jobs_que_app/features/screen_tabbar/applied_view/presentation/view/job_upload_success.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/data/model/all_job_model.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/data/searchcubit/search_cubit.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/search_view/search_view.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/search/search_view/widget/result_screen.dart';
import 'package:jobs_que_app/features/screen_tabbar/home-view/view/widget/detelis.dart/job_description.dart';
import 'package:jobs_que_app/features/screen_tabbar/message_view/view/chat_page.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/Profile.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/Other/Terms&Conditions/Terms&Conditions.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/Other/PrivacyPolicy/PrivacyPolicy.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/Other/HelpCenter/HelpCenter.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/General/porfolioprofile/portfolioprofile.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/General/notification/notification.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/General/loginandsecurity/loginandsecurity.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/General/language/language.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/General/Editprofile/EditProfile.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/General/Editprofile/Complete_profile/Complete_profile.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/General/Editprofile/Complete_profile/Education_screen.dart';
import 'package:jobs_que_app/features/screen_tabbar/profile/General/Editprofile/Complete_profile/Experience_screen.dart';

abstract class AppRouter {
  static const String kintroduction = '/Introduction';
  static const String kLogin = '/Login';
  static const String kSignUp = '/signup';
  static const String kOtpscreen = '/kotpscreen';
  static const String kHome = '/homebody';
  static const String kSearch = '/search';
  static const String kDetails = '/ProductDeteils';
  static const String kDetailsSearch = '/SearchDeteils';
  static const String kApplyJob = '/applyJob';
  static const String kApplyuploadeJob = '/applytypeJob';
  static const String kapplysuccess = '/applysuccess';
  static const String kProfile = Profile.route;
  static const String kchat = "/chat";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const Splash();
        },
      ),
      GoRoute(
        path: kintroduction,
        builder: (context, state) {
          return const PageViewWidget();
        },
      ),
      GoRoute(
        path: kSignUp,
        builder: (context, state) {
          return CreateAccount();
        },
      ),

      GoRoute(
        path: kLogin,
        builder: (context, state) {
          return Login();
        },
      ),
      GoRoute(
        path: kHome,
        builder: (context, state) {
          return BottomNavigaterBar();
        },
      ),
      GoRoute(
        path: kSearch,
        builder: (context, state) {
          final jobName = state.extra as String? ?? "tasnim";
          return BlocProvider(
            create: (context) {
              final cubit = SearchCubit();
              if (jobName.trim().isNotEmpty) {
                cubit.search(jobName: jobName);
              }
              return cubit;
            },
            child: const SearchView(),
          );
        },
      ),
      GoRoute(
        path: kDetails,
        builder: (context, state) {
          final detelis = state.extra as AllJobModel;
          return JobDescription(detelis: detelis);
        },
      ),
      GoRoute(
        path: kDetailsSearch,
        builder: (context, state) {
          return SearchResultScreen();
        },
      ),
      GoRoute(
        path: kapplysuccess,
        builder: (context, state) {
          return JobUploadSuccess();
        },
      ),

      GoRoute(
        path: kApplyJob,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => ApplyCubit(jobId: state.extra as int?),
            child: ApplyedJobBioata(),
          );
        },
      ),
      GoRoute(
        path: kApplyuploadeJob,
        builder: (context, state) {
          final appltcubit = state.extra as ApplyCubit;

          return BlocProvider.value(
            value: appltcubit,
            child: const ApplyUpploadFileJob(),
          );
        },
      ),
      GoRoute(
        path: kProfile,
        builder: (context, state) => const Scaffold(body: Profile()),
      ),
      GoRoute(
        path: ProfileRoutes.edit,
        builder: (context, state) => const EditProfile(),
      ),
      GoRoute(
        path: ProfileRoutes.portfolio,
        builder: (context, state) => const PortfolioProfile(),
      ),
      GoRoute(
        path: ProfileRoutes.language,
        builder: (context, state) => const Languages(),
      ),
      GoRoute(
        path: ProfileRoutes.notifications,
        builder: (context, state) => const Natification(),
      ),
      GoRoute(
        path: ProfileRoutes.help,
        builder: (context, state) => const HelpCenter(),
      ),
      GoRoute(
        path: '/profile/security',
        builder: (context, state) => const LOginAndSecurity(),
      ),
      GoRoute(
        path: ProfileRoutes.complete,
        builder: (context, state) => const CompleteProfile(),
      ),
      GoRoute(
        path: ProfileRoutes.education,
        builder: (context, state) => const Education(),
      ),
      GoRoute(
        path: ProfileRoutes.experience,
        builder: (context, state) => const Experience(),
      ),
      GoRoute(
        path: ProfileRoutes.privacy,
        builder: (context, state) => const PrivacePolocy(),
      ),
      GoRoute(
        path: ProfileRoutes.terms,
        builder: (context, state) => const TermsConditions(),
      ),
      GoRoute(path: kchat, builder: (context, state) => const ChatPage()),
    ],
  );
}

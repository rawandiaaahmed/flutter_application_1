import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/network/api_manager.dart';
import 'package:flutter_application_1/features/forget_password/data/repo/forget_password_repo.dart';
import 'package:flutter_application_1/features/forget_password/presentation/view/ui/forget_password_screen.dart';
import 'package:flutter_application_1/features/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:flutter_application_1/features/login/data/repo/login_repo.dart';
import 'package:flutter_application_1/features/login/presentation/view/ui/login_screen.dart';
import 'package:flutter_application_1/features/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:flutter_application_1/features/new_password/data/repo/new_password_repo.dart';
import 'package:flutter_application_1/features/new_password/presentation/view/ui/new_paasword_screen.dart';
import 'package:flutter_application_1/features/new_password/presentation/view_model/cubit/new_password_cubit.dart';
import 'package:flutter_application_1/features/onboarding/presentation/view/ui/onboarding_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/view_model/Onboarding_cubit.dart';
import 'package:flutter_application_1/features/password_change_success/presentation/view/ui/password_change_succuss.dart';
import 'package:flutter_application_1/features/sign%20up/data/repo/sign_up_repo.dart';
import 'package:flutter_application_1/features/sign%20up/presentation/view/ui/sign_up_screen.dart';
import 'package:flutter_application_1/features/sign%20up/presentation/view_model/cubit/sign_up_cubit.dart';
import 'package:flutter_application_1/features/splash/presentation/view/ui/splash_screen.dart';
import 'package:flutter_application_1/features/verify_code/data/repo/verify_repo.dart';
import 'package:flutter_application_1/features/verify_code/presentation/view/ui/verify_code_screen.dart';
import 'package:flutter_application_1/features/verify_code/presentation/view_model/cubit/verify_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_routes.dart';
import 'route_string.dart';

class AppRoutes {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StringRoute.splash:
        return BaseRoute(
          page: SplashScreen(),
          transitionType: RouteTransitionType.fade,
        );
      case StringRoute.onBoarding:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => OnboardingCubit(),
            child: OnboardingScreen(),
          ),
          transitionType: RouteTransitionType.fade,
        );
      case StringRoute.login:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => LoginCubit(LoginRepo(api: authApi)),
            child: LoginScreen(),
          ),
          transitionType: RouteTransitionType.fade,
        );
      case StringRoute.signup:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => SignUpCubit(SignUpRepo(api: authApi)),
            child: SignUpScreen(),
          ),
          transitionType: RouteTransitionType.fade,
        );
      case StringRoute.forget:
        return BaseRoute(
          page: BlocProvider(
            create: (context) =>
                ForgetPasswordCubit(ForgetPasswordRepo(api: authApi)),
            child: ForgetPasswordScreen(),
          ),
          transitionType: RouteTransitionType.fade,
        );
      case StringRoute.verify:
        final args = settings.arguments;
        if (args != null && args is String) {
          return BaseRoute(
            page: BlocProvider(
              create: (context) => VerifyCubit(VerifyRepo(api: authApi)),
              child: VerifyCodeScreen(email: args),
            ),
            transitionType: RouteTransitionType.fade,
          );
        }
        return _errorPage("Email not provided!");
      case StringRoute.newpassword:
        final args = settings.arguments;
        if (args != null && args is String) {
          return BaseRoute(
            page: BlocProvider(
              create: (context) =>
                  NewPasswordCubit(NewPasswordRepo(api: authApi)),
              child: NewPaaswordScreen(email: args),
            ),
            transitionType: RouteTransitionType.fade,
          );
        }
        return _errorPage("Email not provided!");
      case StringRoute.passwordSuccess:
        return BaseRoute(
          page: PasswordChangeSuccuss(),
          transitionType: RouteTransitionType.fade,
        );

      default:
        return _errorPage("Page not found!");
    }
  }

  static BaseRoute _errorPage(String message) {
    return BaseRoute(
      page: Scaffold(body: Center(child: Text(message))),
      transitionType: RouteTransitionType.fade,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/forget_password/presentation/view/ui/forget_password_screen.dart';
import 'package:flutter_application_1/features/login/presentation/view/ui/login_screen.dart';
import 'package:flutter_application_1/features/new_password/presentation/view/ui/new_paasword_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/view/ui/onboarding_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/view_model/Onboarding_cubit.dart';
import 'package:flutter_application_1/features/password_change_success/presentation/view/ui/password_change_succuss.dart';
import 'package:flutter_application_1/features/sign%20up/presentation/view/ui/sign_up_screen.dart';
import 'package:flutter_application_1/features/splash/presentation/view/ui/splash_screen.dart';
import 'package:flutter_application_1/features/verify_code/presentation/view/ui/verify_code_screen.dart';
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
          page: LoginScreen(),
          transitionType: RouteTransitionType.fade,
        );
      case StringRoute.signup:
        return BaseRoute(
          page: SignUpScreen(),
          transitionType: RouteTransitionType.fade,
        );
      case StringRoute.forget:
        return BaseRoute(
          page: ForgetPasswordScreen(),
          transitionType: RouteTransitionType.fade,
        );
      case StringRoute.verify:
        return BaseRoute(
          page: VerifyCodeScreen(),
          transitionType: RouteTransitionType.fade,
        );
      case StringRoute.newpassword:
        return BaseRoute(
          page: NewPaaswordScreen(),
          transitionType: RouteTransitionType.fade,
        );
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

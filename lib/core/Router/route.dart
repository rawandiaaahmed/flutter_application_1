import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/onboarding/presentation/view/ui/onboarding_screen.dart';
import 'package:flutter_application_1/features/onboarding/presentation/view_model/Onboarding_cubit.dart';
import 'package:flutter_application_1/features/splash/presentation/view/ui/splash_screen.dart';
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

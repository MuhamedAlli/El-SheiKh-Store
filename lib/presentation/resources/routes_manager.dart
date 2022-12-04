import '../../app/dependancy_injection.dart';
import 'strings_manager.dart';
import '../screens/login/login_view.dart';
import '../screens/main/main_view.dart';
import '../screens/onboarding/onboaring_view.dart';
import '../screens/register/register_view.dart';
import '../screens/splash/splash_view.dart';
import '../screens/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/loginRoute";
  static const String registerRoute = "/registerRoute";
  static const String onBoardingRoute = "/onBoardingRoute";
  static const String mainRoute = "/mainRoute";
  static const String storeDetailsRoute = "/storeDetailsRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: ((_) => const SplashView()),
        );
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(
          builder: ((_) => const LoginPage()),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: ((_) => const RegisterView()),
        );
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: ((_) => const MainView()),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: ((_) => const OnBoardingView()),
        );
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(
          builder: ((_) => const StoreDetailsView()),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}

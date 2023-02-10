import 'package:elsheikh_store/domain/model/models.dart';
import 'package:elsheikh_store/presentation/business_logic/cubit/cubit_products/category_products_cubit.dart';
import 'package:elsheikh_store/presentation/screens/login/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/dependancy_injection.dart';
import '../screens/main/category/products_of_particular_category.dart';
import 'strings_manager.dart';
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
  static const String categoryProductsRoute = "/categoryProductsRoute";
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
          builder: ((_) => const LoginView()),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: ((_) => const RegisterView()),
        );
      case Routes.categoryProductsRoute:
        initCatProductsModule();
        var arg = settings.arguments;
        return MaterialPageRoute(
          builder: ((_) => BlocProvider(
                create: (context) => instance<CategoryProductsCubit>(),
                child: CategoryProductsPage(arg),
              )),
        );
      case Routes.mainRoute:
        initHomeModule();
        initCatModule();
        initCartModule();
        return MaterialPageRoute(
          builder: ((_) => const MainView()),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: ((_) => const OnBoardingView()),
        );
      case Routes.storeDetailsRoute:
        Products pro = settings.arguments as Products;
        return MaterialPageRoute(
          builder: ((_) => StoreDetailsView(
                productDetails: pro,
              )),
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

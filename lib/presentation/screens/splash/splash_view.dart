import 'dart:async';

import '../../../app/app_prefs.dart';
import '../../../app/dependancy_injection.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/constants_manager.dart';
import '../../resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  AppPreferences appPreferences = instance<AppPreferences>();

  late bool isViewedOnBoarding;
  late bool isLoggedIn;
  _startDelay() async {
    isViewedOnBoarding = await appPreferences.isOnBoardingScreenViewed();
    isLoggedIn = await appPreferences.isLoggedIn();
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    if (isLoggedIn) {
      Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
    }
    if (!isViewedOnBoarding) {
      Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child: Image.asset(ImageAssets.logo),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "SheiKh Store",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

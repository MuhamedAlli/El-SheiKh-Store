// ignore_for_file: constant_identifier_names

import 'package:elsheikh_store/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_LoggedIN = "PREFS_KEY_LoggedIN";
const String KEY_PREFS_ONBOARDING_SCREEN_VIEWED =
    "KEY_PREFS_ONBOARDING_SCREEN_VIEWED";
const String KEY_PREFS_IS_USER_LOGGED_IN = "KEY_PREFS_IS_USER_LOGGED_IN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);
  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getvalue();
    }
  }

  Future<bool> isLoggedIn() async {
    return _sharedPreferences.getBool(KEY_PREFS_IS_USER_LOGGED_IN) ?? false;
  }

  //on Boarding
  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(KEY_PREFS_ONBOARDING_SCREEN_VIEWED, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(KEY_PREFS_ONBOARDING_SCREEN_VIEWED) ??
        false;
  }

  //Log in
  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(KEY_PREFS_IS_USER_LOGGED_IN, true);
  }

  //Log in
  Future<void> setUserLoggedOut() async {
    _sharedPreferences.remove(KEY_PREFS_IS_USER_LOGGED_IN);
    //_sharedPreferences.setBool(KEY_PREFS_IS_USER_LOGGED_IN, false);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(KEY_PREFS_IS_USER_LOGGED_IN) ?? false;
  }
}

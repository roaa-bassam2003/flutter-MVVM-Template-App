import 'package:flutter_advanced_course/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefskeyLang = "prefskeyLang";
const String prefskeyOnBoardingScreenView = "prefskeyOnBoardingScreenView";
const String prefskeyIsUserLoggedIn = "prefskeyIsUserLoggedIn";

class AppPrefs {
  final SharedPreferences _sharedPreferences;
  AppPrefs(this._sharedPreferences);

  // ignore: body_might_complete_normally_nullable
  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefskeyLang);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default language -> en
      return LanguageType.english.getValue();
    }
  }

  // on boarding
  // set
  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(prefskeyOnBoardingScreenView, true);
  }

  // get
  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(prefskeyOnBoardingScreenView) ?? false;
  }

  // login
  // set
  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(prefskeyIsUserLoggedIn, true);
  }

  // get
  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefskeyIsUserLoggedIn) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(prefskeyIsUserLoggedIn);
  }
}

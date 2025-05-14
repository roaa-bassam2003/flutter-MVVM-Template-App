import 'package:flutter_advanced_course/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefskeyLang = "prefskeyLang";
const String prefskeyOnBoardingScreenView = "prefskeyOnBoardingScreenView";
const String prefskeyIsUserLoggedIn = "prefskeyIsUserLoggedIn";
const String prefsKeyLastButtonPressTime = "prefsKeyLastButtonPressTime";
const String prefsKeyUserName = "prefsKeyUserName";

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

// user name
// set
  Future<void> setUserName(String userName) async {
    await _sharedPreferences.setString(prefsKeyUserName, userName);
  }

// get
  Future<String?> getUserName() async {
    return _sharedPreferences.getString(prefsKeyUserName);
  }

  // Future<void> logoutUserName() async {
  //   _sharedPreferences.remove(prefsKeyUserName);
  // }

// set the last button press time to now
  Future<void> setLastButtonPressTime() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await _sharedPreferences.setInt(prefsKeyLastButtonPressTime, now);
  }

// get the last button press time
  Future<DateTime?> getLastButtonPressTime() async {
    final millis = _sharedPreferences.getInt(prefsKeyLastButtonPressTime);
    if (millis != null) {
      return DateTime.fromMillisecondsSinceEpoch(millis);
    } else {
      return null;
    }
  }

// check if 48 hours passed
  Future<bool> canPressButtonAgain() async {
    final lastTime = await getLastButtonPressTime();
    if (lastTime == null) return true;

    final now = DateTime.now();
    final diff = now.difference(lastTime);
    return diff >= const Duration(hours: 48);
    // return diff >= const Duration(seconds: 20);
  }

  Future<void> logoutDeleteAccount() async {
    _sharedPreferences.remove(prefsKeyLastButtonPressTime);
  }
}

import 'dart:convert';

import 'package:flutter_advanced_course/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefskeyLang = "prefskeyLang";
const String prefskeyOnBoardingScreenView = "prefskeyOnBoardingScreenView";
const String prefskeyIsUserLoggedIn = "prefskeyIsUserLoggedIn";
const String prefsKeyLastButtonPressTime = "prefsKeyLastButtonPressTime";
const String prefsKeyUserName = "prefsKeyUserName";
const String prefsKeyToken = "prefsKeyToken";
const String prefsKeyEmail = "prefsKeyEmail";
const String prefsKeyDayHours = "prefsKeyDayHours"; // New key for day hours

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

  // token
  // set
  Future<void> setLoginToken(String token) async {
    await _sharedPreferences.setString(prefsKeyToken, token);
  }

  // get
  Future<String?> getLoginToken() async {
    return _sharedPreferences.getString(prefsKeyToken);
  }

  // email in forget password
  // set
  Future<void> setEmail(String email) async {
    await _sharedPreferences.setString(prefsKeyEmail, email);
  }

  // get
  Future<String?> getEmail() async {
    return _sharedPreferences.getString(prefsKeyEmail);
  }

  // logout
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

  // NEWLY ADDED METHODS FOR DAY HOURS

  // Save selected hours for a specific day
  Future<void> saveDayHours(
      String day, List<bool> selectedHours, List<String> hoursList) async {
    // Get existing day hours map or create a new one
    Map<String, dynamic> dayHoursMap = await getDayHoursMap();

    // Create a list of selected hour strings based on selectedHours boolean list
    List<String> selectedHourStrings = [];
    for (int i = 0; i < selectedHours.length; i++) {
      if (selectedHours[i]) {
        selectedHourStrings.add(hoursList[i]);
      }
    }

    // Update the map with this day's selected hours
    dayHoursMap[day] = selectedHourStrings;

    // Save the updated map back to SharedPreferences
    await _sharedPreferences.setString(
        prefsKeyDayHours, jsonEncode(dayHoursMap));
  }

  // Get the map of all days and their selected hours
  Future<Map<String, dynamic>> getDayHoursMap() async {
    String? dayHoursJson = _sharedPreferences.getString(prefsKeyDayHours);

    if (dayHoursJson != null && dayHoursJson.isNotEmpty) {
      return jsonDecode(dayHoursJson) as Map<String, dynamic>;
    } else {
      return {};
    }
  }

  // Get selected hours for a specific day
  Future<List<String>> getSelectedHoursForDay(String day) async {
    Map<String, dynamic> dayHoursMap = await getDayHoursMap();

    if (dayHoursMap.containsKey(day)) {
      List<dynamic> hoursDynamic = dayHoursMap[day] as List<dynamic>;
      return hoursDynamic.map((hour) => hour.toString()).toList();
    } else {
      return [];
    }
  }

  // Get boolean list of selected hours for a specific day
  Future<List<bool>> getSelectedHoursBooleanForDay(
      String day, int totalHours) async {
    // List<String> selectedHours = await getSelectedHoursForDay(day);
    List<bool> result = List.generate(totalHours, (index) => false);

    Map<String, dynamic> dayHoursMap = await getDayHoursMap();

    if (dayHoursMap.containsKey(day)) {
      List<dynamic> hoursDynamic = dayHoursMap[day] as List<dynamic>;
      List<String> hours = hoursDynamic.map((hour) => hour.toString()).toList();

      for (String hour in hours) {
        int index = _hours.indexOf(hour);
        if (index != -1) {
          result[index] = true;
        }
      }
    }

    return result;
  }

  // Clear all selected hours for a specific day
  Future<void> clearDayHours(String day) async {
    Map<String, dynamic> dayHoursMap = await getDayHoursMap();

    if (dayHoursMap.containsKey(day)) {
      dayHoursMap.remove(day);
      await _sharedPreferences.setString(
          prefsKeyDayHours, jsonEncode(dayHoursMap));
    }
  }

  // Clear all selected hours for all days
  Future<void> clearAllDayHours() async {
    await _sharedPreferences.remove(prefsKeyDayHours);
  }

  // The fixed hours list - moved from widget to make it accessible for the helper methods
  static final List<String> _hours = [
    '12 am - 1 am',
    '1 am - 2 am',
    '2 am - 3 am',
    '3 am - 4 am',
    '4 am - 5 am',
    '5 am - 6 am',
    '6 am - 7 am',
    '7 am - 8 am',
    '8 am - 9 am',
    '9 am - 10 am',
    '10 am - 11 am',
    '11 am - 12 pm',
    '12 pm - 1 pm',
    '1 pm - 2 pm',
    '2 pm - 3 pm',
    '3 pm - 4 pm',
    '4 pm - 5 pm',
    '5 pm - 6 pm',
    '6 pm - 7 pm',
    '7 pm - 8 pm',
    '8 pm - 9 pm',
    '9 pm - 10 pm',
    '10 pm - 11 pm',
    '11 pm - 12 am',
  ];

  // Getter for the hours list
  static List<String> get hoursList => _hours;
}

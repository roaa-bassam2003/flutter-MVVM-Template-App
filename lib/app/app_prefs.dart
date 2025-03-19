import 'package:flutter_advanced_course/presentation/resources/common/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefskeyLang = "prefskeyLang";

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
}

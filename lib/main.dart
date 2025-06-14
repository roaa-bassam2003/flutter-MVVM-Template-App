import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/app.dart';
import 'package:flutter_advanced_course/app/di.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final prefs = await SharedPreferences.getInstance();
  // await prefs.clear();
  await initAppModule();
  runApp(MyApp());
}

// service provider
// {"email": "keshtaroah@gmail.com","password": "Roaa123456#"}

// client test
// {"email": "r.soliman3526@su.edu.eg", "password": "Rashad1234#"}
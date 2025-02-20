import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/common/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/theme_manager.dart';

class MyApp extends StatelessWidget {
  // Private named constructor for singleton
  // ignore: prefer_const_constructors_in_immutables
  MyApp._internal();

  // Singleton instance
  static final MyApp _instance = MyApp._internal();

  // Factory constructor to return the singleton instance
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}

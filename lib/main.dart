import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/app.dart';
import 'package:flutter_advanced_course/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}

// {email: mohamed123@gmail.com, password: mohamed}
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/app.dart';
import 'package:flutter_advanced_course/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}

// service provider
// {email: mohamed123@gmail.com, password: mohamed123}

// {"email": "keshtaroah@gmail.com","password": "Rb123456#"}

// client test
// {"email": "mohamedc123@gmail.com", "password": "mohamedc123"}
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/service_provider/main/pages/person/view/person_page.dart';
import 'package:flutter_advanced_course/presentation/service_provider/main/pages/schedual/view/shedual_page.dart';
import 'package:flutter_advanced_course/presentation/service_provider/main/pages/setting/view/setting_page.dart';
import 'pages/home/view/home_page.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    HomePage(),
    ShedualPage(),
    SettingPage(),
    PersonPage(),
  ];
  List<String> titles = [
    AppStrings.home,
    AppStrings.shedual,
    AppStrings.setting,
    AppStrings.person,
  ];

  var _title = AppStrings.home;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text(
          _title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        automaticallyImplyLeading: false,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorManager.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: ColorManager.grey,
        currentIndex: _currentIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: AppStrings.home),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule), label: AppStrings.shedual),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: AppStrings.setting),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: AppStrings.person),
        ],
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }
}

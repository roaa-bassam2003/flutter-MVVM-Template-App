import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/home/widgets/home_view_body.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/notifications/notifications_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/profile/my_profile_view.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/settings/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // int _currentIndex = 0;

  // final List<Widget> _pages = [
  //   const HomeViewBody(), // Index 0
  //   NotificationsView(), // Index 1
  //   const MyProfileView(), // Index 2
  //   const SettingsView(), // Index 3
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     bottomNavigationBar: CustomBottomNavigationBar(
  //       onTap: _onItemTapped,
  //       currentIndex: _currentIndex,
  //     ),
  //     backgroundColor: ColorManager.white,
  //     body: IndexedStack(
  //       index: _currentIndex,
  //       children: _pages,
  //     ),
  //   );
  // }
  List<Widget> pages = [
    const HomeViewBody(), // Index 0
    NotificationsView(), // Index 1
    const MyProfileView(), // Index 2
    const SettingsView(), // Index 3
  ];
  List<String> titles = [
    AppStrings.home,
    AppStrings.notification,
    AppStrings.person,
    AppStrings.setting,
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
              icon: Icon(Icons.notifications), label: AppStrings.notification),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: AppStrings.person),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: AppStrings.setting),
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

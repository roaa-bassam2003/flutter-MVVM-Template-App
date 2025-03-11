import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter_advanced_course/presentation/home/widgets/home_view_body.dart';
import 'package:flutter_advanced_course/presentation/notifications/notifications_view.dart';
import 'package:flutter_advanced_course/presentation/profile/my_profile_view.dart';
import 'package:flutter_advanced_course/presentation/settings/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  // قائمة الصفحات
  final List<Widget> _pages = [
    const HomeViewBody(), // Index 0
    NotificationsView(), // Index 1
    const MyProfileView(), // Index 2
    const SettingsView(), // Index 3
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
      ),
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }
}

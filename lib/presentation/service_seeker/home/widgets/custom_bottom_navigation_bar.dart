import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/common/color_manager.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 50.0,
      decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 25,
              offset: Offset(0, -2),
              spreadRadius: 0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            icon: Iconsax.home,
            index: 0,
            label: 'Home',
          ),
          _buildNavItem(
            icon: Iconsax.notification,
            index: 1,
            label: 'Notifications',
          ),
          _buildNavItem(
            icon: Iconsax.user,
            index: 2,
            label: 'Profile',
          ),
          _buildNavItem(
            icon: Iconsax.setting4,
            index: 3,
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
    required String label,
  }) {
    bool isSelected = widget.currentIndex == index;
    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected
                ? ColorManager.primary
                : Colors.black, // لون بنفسجي عند التحديد
            size: 23.0,
          ),
          const SizedBox(height: 4.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              color: isSelected ? ColorManager.primary : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

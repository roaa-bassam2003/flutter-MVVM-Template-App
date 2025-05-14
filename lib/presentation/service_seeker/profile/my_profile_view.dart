// lib/presentation/pages/my_profile_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_list_tile.dart';
import 'package:iconsax/iconsax.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p8,
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(AppPadding.p8),
                  child: Center(
                    child: Text(
                      AppStrings.appBarMyProfileTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Profile Picture
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/person.jpg'),
                ),
                const SizedBox(height: 10),
                // User Name
                const Text(
                  'Jack Wilson',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                // User Handle
                Text(
                  '@se_2025',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 10),
                // List of Profile Options
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // CustomListTile(
                    //   title: 'My info',
                    //   icon: Iconsax.user,
                    //   onTap: () =>
                    //       Navigator.pushNamed(context, Routes.myInfoRoute),
                    // ),
                    CustomListTile(
                      title: AppStrings.appBarEditProfileTitle,
                      icon: Iconsax.edit,
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.editProfileRoute),
                    ),
                    CustomListTile(
                      title: 'Requested Bookings',
                      icon: Iconsax.message,
                      onTap: () => Navigator.pushNamed(
                          context, Routes.requestedBookingsRoute),
                    ),
                    CustomListTile(
                      title: 'Bookings',
                      icon: Iconsax.message_tick,
                      onTap: () => Navigator.pushNamed(
                          context, Routes.currentBookingsRoute),
                    ),
                    CustomListTile(
                      title: 'Cancelled Bookings',
                      icon: Iconsax.calendar_remove,
                      onTap: () => Navigator.pushNamed(
                          context, Routes.cancelledBookingsRoute),
                    ),
                    CustomListTile(
                      title: 'Completed Bookings',
                      icon: Iconsax.calendar_tick,
                      onTap: () => Navigator.pushNamed(
                          context, Routes.completedBookingsRoute),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

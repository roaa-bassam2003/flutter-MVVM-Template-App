import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_list_tile.dart';
import 'package:iconsax/iconsax.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p8,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Text(
                    AppStrings.appBarSettingsTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomListTile(
                  title: 'Edit my profile',
                  icon: Iconsax.edit,
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.editProfileRoute),
                ),
                CustomListTile(
                  title: 'Change password',
                  icon: Iconsax.lock,
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.changePasswordRoute),
                ),
                const CustomListTile(
                  title: 'Support',
                  icon: Iconsax.message,
                ),
                const CustomListTile(
                  title: 'Share the app',
                  icon: Iconsax.share,
                ),
                CustomListTile(
                  title: 'Delete my account',
                  icon: Iconsax.trash,
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.deleteAccountRoute),
                ),
                CustomListTile(
                  title: 'About Magic Parents',
                  icon: Iconsax.info_circle,
                  onTap: () => Navigator.pushNamed(
                      context, Routes.aboutMagicParentsRoute),
                ),
                CustomListTile(
                  title: 'Logout',
                  icon: Iconsax.logout,
                  onTap: () => Navigator.pushNamed(context, Routes.logoutRoute),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

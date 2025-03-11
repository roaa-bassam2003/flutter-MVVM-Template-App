import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/common/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_list_tile.dart';
import 'package:iconsax/iconsax.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p8,
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  AppStrings.appBarSettingsTitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomListTile(
                title: 'Edit my profile',
                icon: Iconsax.edit,
                // onTap: () => _handleSettingTap('Edit my profile', context),
              ),
              CustomListTile(
                title: 'Change password',
                icon: Iconsax.lock,
                // onTap: () => _handleSettingTap('Change password', context),
              ),
              CustomListTile(
                title: 'Support',
                icon: Iconsax.message,
                // onTap: () => _handleSettingTap('Support', context),
              ),
              CustomListTile(
                title: 'Share the app',
                icon: Iconsax.share,
                // onTap: () => _handleSettingTap('Share the app', context),
              ),
              CustomListTile(
                title: 'Delete my account',
                icon: Iconsax.trash,
                // onTap: () => _handleSettingTap('Delete my account', context),
              ),
              CustomListTile(
                title: 'About Magic Parents',
                icon: Iconsax.info_circle,
                // onTap: () => _handleSettingTap('About Magic Parents', context),
              ),
              CustomListTile(
                title: 'Logout',
                icon: Iconsax.logout,
                // onTap: () => _handleSettingTap('Logout', context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

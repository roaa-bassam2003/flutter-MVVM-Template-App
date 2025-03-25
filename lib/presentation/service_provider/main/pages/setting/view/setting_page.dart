import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../widgets/custom_list_tile.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p8,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: AppSize.s12,
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
              onTap: () =>
                  Navigator.pushNamed(context, Routes.aboutMagicParentsRoute),
            ),
            CustomListTile(
              title: 'Logout',
              icon: Iconsax.logout,
              onTap: () => Navigator.pushNamed(context, Routes.logoutRoute),
            ),
            CustomListTile(
              title: 'Payment - Credit',
              icon: Iconsax.card,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

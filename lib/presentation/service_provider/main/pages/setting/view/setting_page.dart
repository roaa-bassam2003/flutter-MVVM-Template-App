import 'package:flutter/material.dart';
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
              onTap: () {},
            ),
            CustomListTile(
              title: 'Change password',
              icon: Iconsax.lock,
              onTap: () {},
            ),
            CustomListTile(
              title: 'Support',
              icon: Iconsax.message,
              onTap: () {},
            ),
            CustomListTile(
              title: 'Share the app',
              icon: Iconsax.share,
              onTap: () {},
            ),
            CustomListTile(
              title: 'Delete my account',
              icon: Iconsax.trash,
              onTap: () {},
            ),
            CustomListTile(
              title: 'About Magic Parents',
              icon: Iconsax.info_circle,
              onTap: () {},
            ),
            CustomListTile(
              title: 'Logout',
              icon: Iconsax.logout,
              onTap: () {},
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
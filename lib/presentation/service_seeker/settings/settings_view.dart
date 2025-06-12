import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_list_tile.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  Future<void> _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'magic.parents@gmail.com',
      // You can add subject and body as well
      // queryParameters: {'subject': 'App Support', 'body': 'Hello,'}
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      // Handle error
      debugPrint('Could not launch email client');
    }
  }

  void _shareApp() {
    Share.share(
      'Check out this awesome app: https://yourapp.link',
      subject: 'Download The Magic Parents App',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p8,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                CustomListTile(
                  title: AppStrings.appBarChangePasswordTitle,
                  icon: Iconsax.lock,
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.changePasswordRoute),
                ),
                CustomListTile(
                  title: AppStrings.support,
                  icon: Iconsax.message,
                  onTap: _sendEmail,
                ),
                CustomListTile(
                  title: AppStrings.shareTheApp,
                  icon: Iconsax.share,
                  onTap: _shareApp,
                ),
                CustomListTile(
                  title: AppStrings.appBarDeleteAccountTitle,
                  icon: Iconsax.trash,
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.deleteAccountRoute),
                ),
                CustomListTile(
                  title: AppStrings.appBarAboutAppTitle,
                  icon: Iconsax.info_circle,
                  onTap: () => Navigator.pushNamed(
                      context, Routes.aboutMagicParentsRoute),
                ),
                CustomListTile(
                  title: AppStrings.appBarLogoutTitle,
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

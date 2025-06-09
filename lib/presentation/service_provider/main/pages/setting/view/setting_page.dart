import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../widgets/custom_list_tile.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Future<void> _sendEmail() async {
    final String subject = Uri.encodeComponent('Support');
    final String body = Uri.encodeComponent('Problem');
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'magicteam285@gmail.com',
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    try {
      bool launched = await launchUrl(
        emailLaunchUri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        throw 'Could not launch email client';
      }
    } catch (e) {
      debugPrint('Error: $e');

      // fallback: open URL in browser
      final webFallback = Uri.parse(
          'https://mail.google.com/mail/?view=cm&fs=1&to=magicteam285@gmail.com');
      if (await canLaunchUrl(webFallback)) {
        await launchUrl(webFallback, mode: LaunchMode.externalApplication);
      } else {
        debugPrint('Fallback also failed');
      }
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
            // CustomListTile(
            //   title: AppStrings.appBarEditProfileTitle,
            //   icon: Iconsax.edit,
            //   onTap: () =>
            //       Navigator.pushNamed(context, ProviderRoutes.pEditProfileView),
            // ),
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
              onTap: () =>
                  Navigator.pushNamed(context, Routes.aboutMagicParentsRoute),
            ),
            CustomListTile(
              title: AppStrings.appBarLogoutTitle,
              icon: Iconsax.logout,
              onTap: () => Navigator.pushNamed(context, Routes.logoutRoute),
            ),
          ],
        ),
      ),
    );
  }
}

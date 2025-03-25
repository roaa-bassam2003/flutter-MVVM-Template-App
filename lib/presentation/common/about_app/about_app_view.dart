import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppStrings.appBarAboutAppTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.aboutUs,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(AppStrings.aboutUsDescription),
            //Logo
            Center(
              child: Image.asset(
                ImageAssets.splashLogo,
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

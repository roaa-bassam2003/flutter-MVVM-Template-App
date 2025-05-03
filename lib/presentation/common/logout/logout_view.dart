import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/app_prefs.dart';
import 'package:flutter_advanced_course/app/di.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';

class LogoutView extends StatelessWidget {
  final AppPrefs _appPrefs = instance<AppPrefs>();

  LogoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppStrings.appBarEditProfileTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        child: Column(
          children: [
            const SizedBox(height: AppSize.s8),
            Center(
              child: Text(
                AppStrings.areYouSure,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primary,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: AppStrings.appBarLogoutTitle,
              onPressed: () {
                // save in app Prefs
                _appPrefs.logout();
                // log out
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              },
              backgroundColor: ColorManager.primary,
            )
          ],
        ),
      ),
    );
  }
}

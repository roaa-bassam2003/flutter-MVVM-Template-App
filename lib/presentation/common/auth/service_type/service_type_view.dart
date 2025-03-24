import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_drop_down_button.dart';
import 'package:flutter_advanced_course/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

class ServiceTypeView extends StatelessWidget {
  const ServiceTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: Column(
          children: [
            //Logo
            Center(
              child: Image.asset(
                ImageAssets.splashLogo,
                width: 200,
                height: 200,
              ),
            ),
            const Text(AppStrings.serviceTypeQuestion),
            const SizedBox(height: 50),
            CustomDropdownButton(
              fontWeight: false,
              backgroundColor: ColorManager.white,
              textColor: ColorManager.primary,
              iconColor: ColorManager.primary,
              borderColor: ColorManager.primary,
              hint: AppStrings.selectService,
              items: const [
                'Pet Care',
                'Nurse',
                'Elderly Care',
                'Babysitter',
              ],
            ),
            // space
            const SizedBox(height: 18),
            //Login
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.registerProviderRoute);
              },
              text: AppStrings.continueButton,
              backgroundColor: ColorManager.primary,
            ),
          ],
        ),
      ),
    );
  }
}

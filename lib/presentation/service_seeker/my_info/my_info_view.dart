import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';

class MyInfoView extends StatelessWidget {
  const MyInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppStrings.appBarMyInfoTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSize.s8),
            Text(
              AppStrings.currentAddress,
              style: TextStyle(
                fontSize: 16,
                color: ColorManager.primary,
              ),
            ),
            const Text(
              AppStrings.currentAddressValue,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              AppStrings.mobileNumber,
              style: TextStyle(
                fontSize: 16,
                color: ColorManager.primary,
              ),
            ),
            const Text(
              AppStrings.phoneNumberValue,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              AppStrings.email,
              style: TextStyle(
                fontSize: 16,
                color: ColorManager.primary,
              ),
            ),
            const Text(
              AppStrings.emailValue,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

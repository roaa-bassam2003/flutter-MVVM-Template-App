import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/font_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';

class MyInfoView extends StatelessWidget {
  const MyInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
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
                fontSize: FontSize.s16,
                color: ColorManager.primary,
              ),
            ),
            Text(
              AppStrings.currentAddressValue,
              style: TextStyle(
                fontSize: AppSize.s12,
                color: ColorManager.black,
              ),
            ),
            const SizedBox(height: AppSize.s10),
            Text(
              AppStrings.mobileNumber,
              style: TextStyle(
                fontSize: AppSize.s16,
                color: ColorManager.primary,
              ),
            ),
            Text(
              AppStrings.phoneNumberValue,
              style: TextStyle(
                fontSize: AppSize.s14,
                color: ColorManager.black,
              ),
            ),
            const SizedBox(height: AppSize.s10),
            Text(
              AppStrings.email,
              style: TextStyle(
                fontSize: AppSize.s16,
                color: ColorManager.primary,
              ),
            ),
            Text(
              AppStrings.emailValue,
              style: TextStyle(
                fontSize: AppSize.s14,
                color: ColorManager.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

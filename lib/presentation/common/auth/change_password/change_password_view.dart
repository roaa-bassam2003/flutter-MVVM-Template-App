import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppStrings.appBarChangePasswordTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextFormField(
                hintText: AppStrings.oldPassword,
                textInputType: TextInputType.text),
            const SizedBox(height: 10),
            const CustomTextFormField(
                hintText: AppStrings.currentPassword,
                textInputType: TextInputType.text),
            const SizedBox(height: 20),
            CustomButton(
                text: AppStrings.change,
                onPressed: () {},
                backgroundColor: ColorManager.primary),
            const SizedBox(height: 5),
// Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                  },
                  text: AppStrings.forgotPassword,
                  textColor: ColorManager.darkGrey,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

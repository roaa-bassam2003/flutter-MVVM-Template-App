import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';

class DeleteAccountView extends StatelessWidget {
  const DeleteAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppStrings.appBarDeleteAccountTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: Column(
          children: [
            const SizedBox(height: AppSize.s8),
            Center(
              child: Text(
                AppStrings.deleteConfirmationMessage,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primary,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: AppStrings.appBarDeleteAccountTitle,
              onPressed: () {},
              backgroundColor: ColorManager.primary,
            )
          ],
        ),
      ),
    );
  }
}

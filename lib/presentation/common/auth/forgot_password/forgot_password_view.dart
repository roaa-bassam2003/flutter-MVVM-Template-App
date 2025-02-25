import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/widgets/custom_button.dart';
import 'package:flutter_advanced_course/core/widgets/custom_text_button.dart';
import 'package:flutter_advanced_course/core/widgets/custom_text_form_field.dart';
import 'package:flutter_advanced_course/presentation/resources/common/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: Column(
          children: [
            //Space
            const SizedBox(height: 70),
            //Logo
            Center(
              child: Image.asset(
                ImageAssets.splashLogo,
                width: 200,
                height: 200,
              ),
            ),
            //Username
            const CustomTextFormField(
              hintText: 'Enter Email Adderess',
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 4),
            CustomTextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.loginRoute);
              },
              text: 'Back to sign in',
            ),
            // space
            const SizedBox(height: 18),
            //Login
            CustomButton(
              onPressed: () {},
              text: 'Send',
              backgroundColor: ColorManager.primary,
            ),
          ],
        ),
      ),
    );
  }
}

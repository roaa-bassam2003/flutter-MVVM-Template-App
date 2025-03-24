import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter_advanced_course/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

import '../../../resources/routes_manager.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

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
            //Username
            const CustomTextFormField(
              hintText: AppStrings.usernameOrEmail,
              textInputType: TextInputType.emailAddress,
            ),
            // space
            const SizedBox(height: 20),
            //Login
            CustomButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(ProviderRoutes.mainRoute);
              },
              text: AppStrings.send,
              backgroundColor: ColorManager.primary,
            ),
          ],
        ),
      ),
    );
  }
}

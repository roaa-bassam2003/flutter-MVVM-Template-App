import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/core/widgets/custom_button.dart';
import 'package:flutter_advanced_course/core/widgets/custom_drop_down_button.dart';
import 'package:flutter_advanced_course/presentation/resources/common/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';

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
            const Text('What kind of service do you provide?'),
            const SizedBox(height: 50),
            const CustomDropdownButton(),
            // space
            const SizedBox(height: 18),
            //Login
            CustomButton(
              onPressed: () {},
              text: 'Continue',
              backgroundColor: ColorManager.primary,
            ),
          ],
        ),
      ),
    );
  }
}

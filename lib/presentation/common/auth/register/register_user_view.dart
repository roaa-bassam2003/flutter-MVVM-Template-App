import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/resources/common/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';

class RegisterUserView extends StatelessWidget {
  const RegisterUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ],
        ),
      ),
    );
  }
}

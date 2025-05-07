import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';

class WorkFlowSpecification extends StatelessWidget {
  const WorkFlowSpecification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: customAppBar(title: AppStrings.appBarWorkFlowSpecific),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Center(
                child: Image.asset(
                  ImageAssets.splashLogo,
                  width: AppSize.s200,
                  height: AppSize.s200,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
            const Text(AppStrings.terms),
          ],
        ),
      ),
    );
  }
}

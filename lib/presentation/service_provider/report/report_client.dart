import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/report_provider/widgets/custom_static_field.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';

class ReportClient extends StatelessWidget {
  const ReportClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: customAppBar(title: AppStrings.appBarReportTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: Column(
          children: [
            const SizedBox(height: AppSize.s16),
            // Title
            Text(
              AppStrings.reportClientLabel,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,
              ),
            ),
            const SizedBox(height: AppSize.s18),
            // Provider ID (Static Container)
            const CustomStaticField(
              label: "@ss_2025",
            ),
            const SizedBox(height: AppSize.s16),
            const CustomTextFormField(
                hintText: AppStrings.problem,
                textInputType: TextInputType.text),
            const SizedBox(height: AppSize.s16),
            CustomButton(
              text: AppStrings.appBarReportTitle,
              onPressed: () {},
              backgroundColor: ColorManager.primary,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/report_provider/widgets/custom_static_field.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';

class ReportProviderView extends StatelessWidget {
  const ReportProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = ModalRoute.of(context)!.settings.arguments as Provider;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppStrings.appBarReportTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        child: Column(
          children: [
            const SizedBox(height: AppSize.s16),
            // Title
            Text(
              'Report about this service provider',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,
              ),
            ),
            const SizedBox(height: AppSize.s18),
            // Provider ID (Static Container)
            CustomStaticField(
              label: provider.providerId,
            ),
            const SizedBox(height: AppSize.s16),
            // Role (Static Container)
            CustomStaticField(
              label: provider.role,
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

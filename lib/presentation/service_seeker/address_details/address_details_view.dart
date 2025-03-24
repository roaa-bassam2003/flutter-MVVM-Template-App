import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_drop_down_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';

class AddressDetailsView extends StatelessWidget {
  const AddressDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final String? serviceName =
        ModalRoute.of(context)!.settings.arguments as String?;
    if (serviceName == null) {
      return const Scaffold(
        body: Center(
          child: Text('Error: Please select a service first.'),
        ),
      );
    }
    return Scaffold(
        appBar: customAppBar(title: 'Address'),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p8,
          ),
          child: Column(
            children: [
              Text(
                AppStrings.addressDetailsLabel,
                style: TextStyle(
                  color: ColorManager.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              CustomDropdownButton(
                textColor: ColorManager.grey,
                backgroundColor: ColorManager.white,
                borderColor: ColorManager.lightGrey,
                hint: AppStrings.governorate,
                items: const [],
              ),
              const SizedBox(height: 10),
              CustomDropdownButton(
                textColor: ColorManager.grey,
                backgroundColor: ColorManager.white,
                borderColor: ColorManager.lightGrey,
                hint: AppStrings.city,
                items: const [],
              ),
              const SizedBox(height: 10),
              CustomDropdownButton(
                textColor: ColorManager.grey,
                backgroundColor: ColorManager.white,
                borderColor: ColorManager.lightGrey,
                hint: AppStrings.day,
                items: const [],
              ),
              const SizedBox(height: 10),
              const CustomTextFormField(
                hintText: 'Address',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.serviceProvidersRoute,
                    arguments: serviceName,
                  );
                },
                text: 'Next',
                backgroundColor: ColorManager.primary,
              )
            ],
          ),
        ));
  }
}

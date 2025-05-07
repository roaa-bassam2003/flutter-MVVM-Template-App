import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_drop_down_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';

class PEditProfileView extends StatelessWidget {
  const PEditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppStrings.appBarEditProfileTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextFormField(
              hintText: AppStrings.name,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            const CustomTextFormField(
                hintText: AppStrings.mobileNumber,
                textInputType: TextInputType.text),
            const SizedBox(height: 10),
            //Profile Picture
            const CustomTextFormField(
              hintText: AppStrings.profilePicture,
              textInputType: TextInputType.text,
              suffixIcon: Icon(Icons.camera_alt_outlined),
            ),
            const SizedBox(height: 10),

            //Governorate
            CustomDropdownButton(
              textColor: ColorManager.grey,
              backgroundColor: ColorManager.white,
              borderColor: ColorManager.lightGrey,
              hint: AppStrings.governorate,
              items: const [],
            ),
            //Space
            const SizedBox(height: 10),
            //city
            CustomDropdownButton(
              textColor: ColorManager.grey,
              backgroundColor: ColorManager.white,
              borderColor: ColorManager.lightGrey,
              hint: AppStrings.city,
              items: const [],
            ),
            const SizedBox(height: 10),
            //hours
            CustomDropdownButton(
              textColor: ColorManager.grey,
              backgroundColor: ColorManager.white,
              borderColor: ColorManager.lightGrey,
              hint: AppStrings.hours,
              items: const [],
            ),
            // btn
            const SizedBox(height: 20),
            CustomButton(
              text: AppStrings.edit,
              onPressed: () {},
              backgroundColor: ColorManager.primary,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        title: AppStrings.appBarSearchTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
        ),
        child: Column(
          children: [
            const SizedBox(height: 70),
            const CustomTextFormField(
              hintText: AppStrings.appBarSearchTitle,
              textInputType: TextInputType.text,
              suffixIcon: Icon(Icons.search),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: AppStrings.appBarSearchTitle,
              onPressed: () {},
              backgroundColor: ColorManager.primary,
            )
          ],
        ),
      ),
    );
  }
}

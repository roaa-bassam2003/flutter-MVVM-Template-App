import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ResetPasswordView> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: customAppBar(title: AppStrings.appBarChangePasswordTitle),
      body: _getContentWidget(),
    );
  }

  Widget _getContentWidget() {
    return Padding(
      padding: const EdgeInsets.all(
        AppPadding.p20,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextFormField(
              hintText: AppStrings.oldPassword,
              labelText: AppStrings.oldPassword,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            const CustomTextFormField(
              labelText: AppStrings.currentPassword,
              hintText: AppStrings.currentPassword,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: AppStrings.change,
              backgroundColor: ColorManager.primary,
              onPressed: () {},
            ),
            const SizedBox(height: 5),
            // Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                  },
                  text: AppStrings.forgotPassword,
                  textColor: ColorManager.darkGrey,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

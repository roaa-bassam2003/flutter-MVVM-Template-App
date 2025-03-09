import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/common/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_drop_down_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter_advanced_course/presentation/resources/common/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';

class RegisterUserView extends StatelessWidget {
  const RegisterUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: SingleChildScrollView(
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

              //name
              const CustomTextFormField(
                hintText: AppStrings.name,
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 8),
              // Mobile Number
              const CustomTextFormField(
                hintText: AppStrings.mobileNumber,
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 8),
              //Email
              const CustomTextFormField(
                hintText: AppStrings.email,
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 8),
              // Password
              const CustomTextFormField(
                hintText: AppStrings.password,
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 8),
              //Profile Picture
              const CustomTextFormField(
                hintText: AppStrings.profilePicture,
                textInputType: TextInputType.text,
                suffixIcon: Icon(Icons.camera_alt_outlined),
              ),
              //Space
              const SizedBox(height: 8),
              //Front ID Picture
              const CustomTextFormField(
                hintText: AppStrings.frontIdPicture,
                textInputType: TextInputType.text,
                suffixIcon: Icon(Icons.camera_alt_outlined),
              ),
              //Space
              const SizedBox(height: 8),
              //Back ID Picture
              const CustomTextFormField(
                hintText: AppStrings.backIdPicture,
                textInputType: TextInputType.text,
                suffixIcon: Icon(Icons.camera_alt_outlined),
              ),
              //Space
              const SizedBox(height: 8),
              //Governorate
              CustomDropdownButton(
                textColor: ColorManager.grey,
                backgroundColor: ColorManager.white,
                borderColor: ColorManager.lightGrey,
                hint: AppStrings.governorate,
                items: const [],
              ),
              //Space
              const SizedBox(height: 8),
              //city
              CustomDropdownButton(
                textColor: ColorManager.grey,
                backgroundColor: ColorManager.white,
                borderColor: ColorManager.lightGrey,
                hint: AppStrings.city,
                items: const [],
              ),
              //Space
              const SizedBox(height: 8),
              //current Address
              const CustomTextFormField(
                hintText: AppStrings.currentAddress,
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 18),
              // button Register
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.pendingApproval);
                },
                text: AppStrings.register,
                backgroundColor: ColorManager.primary,
              ),
              //Space
              const SizedBox(height: 5),
              //Already have an account? Login
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(AppStrings.alreadyHaveAccount),
                  CustomTextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                    text: AppStrings.login,
                    textColor: ColorManager.primary,
                  )
                ],
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}

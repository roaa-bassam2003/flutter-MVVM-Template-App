import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/core/widgets/custom_button.dart';
import 'package:flutter_advanced_course/core/widgets/custom_text_button.dart';
import 'package:flutter_advanced_course/core/widgets/custom_text_form_field.dart';
import 'package:flutter_advanced_course/presentation/resources/common/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';

class RegisterProviderView extends StatelessWidget {
  const RegisterProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                hintText: 'Username',
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 8),
              // Mobile Number
              const CustomTextFormField(
                hintText: 'Mobile Number',
                textInputType: TextInputType.phone,
              ),
              //Space
              const SizedBox(height: 8),
              //Email
              const CustomTextFormField(
                hintText: 'Email',
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 8),
              // Password
              const CustomTextFormField(
                hintText: 'Password',
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 8),
              //Profile Picture
              const CustomTextFormField(
                hintText: 'Profile Picture',
                textInputType: TextInputType.text,
                suffixIcon: Icon(Icons.camera_alt_outlined),
              ),
              //Space
              const SizedBox(height: 8),
              //city
              const CustomTextFormField(
                hintText: 'City',
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 8),
              //current Address
              const CustomTextFormField(
                hintText: 'Current Address',
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 8),
              //current Address
              const CustomTextFormField(
                hintText: 'Age',
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 8),
              //current Address
              const CustomTextFormField(
                hintText: 'Gender',
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 8),
              //current Address
              const CustomTextFormField(
                hintText: 'Card num',
                textInputType: TextInputType.number,
              ),
              //Space
              const SizedBox(height: 8),
              //current Address
              const CustomTextFormField(
                hintText: 'Experience',
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 8),
              //current Address
              const CustomTextFormField(
                hintText: 'Upload your CV',
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 8),
              //current Address
              const CustomTextFormField(
                hintText: 'Certifications',
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 8),
              //current Address
              const CustomTextFormField(
                hintText: 'Special Skills',
                textInputType: TextInputType.text,
              ),
              //Space
              const SizedBox(height: 18),
              // button Register
              CustomButton(
                  onPressed: () {},
                  text: 'Register',
                  backgroundColor: ColorManager.primary),
              //Already have an account? Login
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('Already have an account? '),
                  CustomTextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                    text: 'Login',
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

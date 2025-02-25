import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/widgets/custom_button.dart';
import 'package:flutter_advanced_course/core/widgets/custom_text_button.dart';
import 'package:flutter_advanced_course/core/widgets/custom_text_form_field.dart';
import 'package:flutter_advanced_course/presentation/resources/common/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Space
              const SizedBox(height: 70),
              //Logo
              Center(
                child: Image.asset(
                  ImageAssets.splashLogo,
                  width: 200,
                  height: 200,
                ),
              ),
              //Username
              const CustomTextFormField(
                hintText: 'Username',
                textInputType: TextInputType.text,
              ),
              // space
              const SizedBox(height: 10),
              //Username
              const CustomTextFormField(
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                ),
              ),
              // space
              const SizedBox(height: 10),
              // Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                    },
                    text: 'Forget Password?',
                    textColor: ColorManager.darkGrey,
                  )
                ],
              ),
              // space
              const SizedBox(height: 10),
              //Login
              CustomButton(
                onPressed: () {},
                text: 'Login',
                backgroundColor: ColorManager.primary,
              ),
              // space
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Have an account? '),
                  CustomTextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.userTypeRoute);
                    },
                    text: 'Sign Up',
                    textColor: ColorManager.primary,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

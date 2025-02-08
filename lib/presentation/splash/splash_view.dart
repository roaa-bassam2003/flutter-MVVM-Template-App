import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/constants_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/font_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: AppSize.s40),
            Text(
              AppStrings.splashTitle,
              style: TextStyle(
                fontSize: FontSize.s22,
                fontWeight: FontWeightManager.bold,
                color: ColorManager.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSize.s8),
            Text(
              AppStrings.splashSubTitle,
              style: TextStyle(
                fontSize: FontSize.s14,
                color: ColorManager.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            const Image(
              image: AssetImage(ImageAssets.splashLogo),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

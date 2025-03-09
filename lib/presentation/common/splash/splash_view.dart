import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/resources/common/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/constants_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/font_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';

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
      appBar: customAppBar(),
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

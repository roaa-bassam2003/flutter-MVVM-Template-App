import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class HomeServiceCard extends StatelessWidget {
  final String title;
  final String backgroundImage;
  final VoidCallback onTap;

  const HomeServiceCard({
    super.key,
    required this.title,
    required this.backgroundImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppMargin.m10,
        horizontal: AppMargin.m16,
      ),
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s20),
        boxShadow: [
          BoxShadow(
            color: ColorManager.lightGrey,
            blurRadius: AppSize.s8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image Section
          Container(
            height: AppSize.s120,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Svg(backgroundImage),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s12),
          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: AppSize.s18,
              fontWeight: FontWeight.bold,
              color: ColorManager.black,
            ),
          ),
          const SizedBox(height: AppSize.s12),
          // View Details Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                // backgroundColor: const Color(0xFF3E347E), // dark blue
                backgroundColor: ColorManager.darkBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s8),
                ),
              ),
              child: Text(
                AppStrings.viewDetails,
                style: TextStyle(
                  color: ColorManager.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

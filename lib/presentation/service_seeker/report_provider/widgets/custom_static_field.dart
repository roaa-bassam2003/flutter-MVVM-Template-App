import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

class CustomStaticField extends StatelessWidget {
  final String label;

  const CustomStaticField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p12,
        horizontal: AppPadding.p16,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.lightGrey, width: 1.5),
        borderRadius: BorderRadius.circular(AppPadding.p8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }
}

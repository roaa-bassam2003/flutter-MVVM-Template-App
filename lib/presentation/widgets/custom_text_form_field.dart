import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';

import '../resources/common/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.constraints,
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final BoxConstraints? constraints;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        contentPadding: const EdgeInsets.only(left: 20.0), // مسافة من اليسار
        constraints: constraints,
        enabledBorder: buildBorder(),
        border: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppPadding.p8),
      borderSide: BorderSide(
        width: 1.5,
        color: ColorManager.lightGrey,
      ),
    );
  }
}

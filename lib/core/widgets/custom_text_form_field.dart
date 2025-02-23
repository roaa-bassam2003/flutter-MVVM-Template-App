import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';

import '../../presentation/resources/common/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffixIcon});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        contentPadding: const EdgeInsets.only(left: 20.0), // مسافة من اليسار
        // constraints: const BoxConstraints(
        //   minHeight: 30, // الحد الأدنى للارتفاع
        //   maxHeight: 40, // الحد الأقصى للارتفاع
        // ),
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
        color: ColorManager.lightGrey,
      ),
    );
  }
}

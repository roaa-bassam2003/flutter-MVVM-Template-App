// import 'package:analyzer/dart/ast/ast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.constraints,
    this.controller,
    this.labelText,
    this.errorText,
    this.obscureText = false,
    this.onSuffixIconPressed, 
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final BoxConstraints? constraints;
  final TextEditingController? controller;
  final String? labelText;
  final String? errorText;
  final bool obscureText;
  final VoidCallback? onSuffixIconPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: suffixIcon!,
                onPressed: onSuffixIconPressed,
              )
            : null,
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

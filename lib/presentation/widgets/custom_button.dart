import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // يجعل الزر يأخذ عرض الشاشة بالكامل
      height: 50, // ارتفاع الزر
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // اللون البنفسجي
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppPadding.p8), // حواف دائرية
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white, // لون النص أبيض
            fontSize: 16, // حجم الخط
            fontWeight: FontWeight.bold, // جعل الخط عريضًا
          ),
        ),
      ),
    );
  }
}

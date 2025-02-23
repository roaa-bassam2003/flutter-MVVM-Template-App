import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.grey, // لون افتراضي غامق
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, // يزيل التباعد الافتراضي
        minimumSize: const Size(0, 0), // يمنع زيادة الحجم
        tapTargetSize:
            MaterialTapTargetSize.shrinkWrap, // يجعل الزر بالحجم الطبيعي للنص
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}

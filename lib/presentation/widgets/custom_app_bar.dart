import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

AppBar customAppBar({
  String title = '',
  bool isIcon = false,
  IconButton? iconButton,
}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
      ),
    ),
    elevation: AppSize.s0,
    backgroundColor: Colors.white,
    actions: [
      if (isIcon && iconButton != null)
        iconButton, // عرض الأيقونة فقط عند الحاجة
    ],
  );
}

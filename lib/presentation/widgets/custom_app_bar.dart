import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';

AppBar customAppBar({String title = '', bool isIcon = false}) {
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
      isIcon
          ? IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // منطق البحث هنا
              },
            )
          : const SizedBox()
    ],
  );
}

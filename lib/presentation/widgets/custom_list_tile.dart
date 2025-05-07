import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:iconsax/iconsax.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const CustomListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // spacing: 0,
      children: [
        ListTile(
          leading: Icon(icon, color: ColorManager.black, size: AppSize.s24),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: Icon(Iconsax.arrow_right_3,
              color: ColorManager.black, size: AppSize.s20),
          onTap: onTap,
        ),
        Divider(
          color: ColorManager.lightGrey,
          height: AppSize.s0,
          endIndent: AppSize.s20,
          indent: AppSize.s10,
          thickness: AppSize.s1,
        )
      ],
    );
  }
}

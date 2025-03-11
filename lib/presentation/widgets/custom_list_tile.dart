import 'package:flutter/material.dart';
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
      spacing: 0,
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black, size: 24),
          title: Text(
            title,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
          trailing:
              const Icon(Iconsax.arrow_right_3, color: Colors.black, size: 20),
          onTap: onTap,
        ),
        const Divider(
          color: Colors.grey,
          height: 0,
          endIndent: 20,
          indent: 10,
          thickness: 1,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../resources/strings_manager.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.person),
    );
  }
}
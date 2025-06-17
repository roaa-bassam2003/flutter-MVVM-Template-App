import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_card_update_with_no_btns.dart';

class RejectedTab extends StatefulWidget {
  const RejectedTab({super.key});

  @override
  State<RejectedTab> createState() => _RejectedTabState();
}

class _RejectedTabState extends State<RejectedTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: const NeverScrollableScrollPhysics(),
      child: _card(),
    );
  }

  Widget _card() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProviderRoutes.completedDetails);
      },
      child: const Column(
        children: [
          CustomCardUpdateWithNoBtns(
            name: 'Karim Ahmed',
            location: 'Egypt, North Sini, Arish, See Street',
            timeSlots: ['8 am - 9 am'],
            day: "Saturday",
          ),
        ],
      ),
    );
  }
}

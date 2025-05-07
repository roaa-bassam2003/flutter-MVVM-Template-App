import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_card_update_with_no_btns.dart';

class CompletedTab extends StatefulWidget {
  const CompletedTab({super.key});

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          6,
          (index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _card(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProviderRoutes.completedDetails);
      },
      child: const CustomCardUpdateWithNoBtns(
        name: 'Karim Ahmed',
        location: 'Egypt, North Sini, Arish, See Street',
        timeSlots: ['7 am - 8 am', '8 am - 9 am'],
        day: "Saturday",
      ),
    );
  }
}

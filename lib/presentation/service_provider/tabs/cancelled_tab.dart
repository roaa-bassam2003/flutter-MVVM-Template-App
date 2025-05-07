import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_card_update_with_no_btns.dart';

class CancelledTab extends StatefulWidget {
  const CancelledTab({super.key});

  @override
  State<CancelledTab> createState() => _CancelledTabState();
}

class _CancelledTabState extends State<CancelledTab> {
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
        Navigator.pushNamed(context, ProviderRoutes.cancelledDetails);
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

import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_card_updated.dart';

class RequestsTab extends StatefulWidget {
  const RequestsTab({super.key});

  @override
  State<RequestsTab> createState() => _RequestsTabState();
}

class _RequestsTabState extends State<RequestsTab> {
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
        Navigator.pushNamed(context, ProviderRoutes.requestDetails);
      },
      child: Column(
        children: [
          CustomCardUpdated(
            name: 'Karim Ahmed',
            location: 'Egypt, North Sini, Arish, See Street',
            timeSlots: const ['8 am - 9 am'],
            day: "Saturday",
            btnName1: AppStrings.notApprove,
            onPressed1: () {},
            btnName2: AppStrings.approve,
            onPressed2: () {},
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_card_updated.dart';

class BookingsTab extends StatefulWidget {
  const BookingsTab({super.key});

  @override
  State<BookingsTab> createState() => _BookingsTabState();
}

class _BookingsTabState extends State<BookingsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: List.generate(
          6,
          (index) => Column(
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
        Navigator.pushNamed(context, ProviderRoutes.bookingsDetails);
      },
      child: Column(
        children: [
          CustomCardUpdated(
            name: 'Karim Ahmed',
            location: 'Egypt, North Sini, Arish, See Street',
            timeSlots: const ['7 am - 8 am', '8 am - 9 am'],
            day: "Saturday",
            btnName1: AppStrings.cancelled,
            onPressed1: () {},
            btnName2: AppStrings.completed,
            onPressed2: () {},
          ),
        ],
      ),
    );
  }
}

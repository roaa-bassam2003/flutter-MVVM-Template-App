import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_card_updated.dart';

class RequestedBookingsView extends StatefulWidget {
  const RequestedBookingsView({super.key});

  @override
  State<RequestedBookingsView> createState() => _RequestedBookingsViewState();
}

class _RequestedBookingsViewState extends State<RequestedBookingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppStrings.appBarRequestedBookingsTitle),
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: List.generate(
            6,
            (index) => Column(
              children: [
                _card(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _card(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.bookingsDetails);
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
            // btnName2: AppStrings.completed,
            // onPressed2: () {},
          ),
        ],
      ),
    );
  }
}

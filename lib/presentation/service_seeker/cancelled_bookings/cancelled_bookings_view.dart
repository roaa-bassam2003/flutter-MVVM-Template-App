import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_card_update_with_no_btns.dart';

class CancelledBookingsView extends StatefulWidget {
  const CancelledBookingsView({super.key});

  @override
  State<CancelledBookingsView> createState() => _CancelledBookingsViewState();
}

class _CancelledBookingsViewState extends State<CancelledBookingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppStrings.appBarCancelledBookingsTitle),
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
      child: const CustomCardUpdateWithNoBtns(
        name: 'Karim Ahmed',
        location: 'Egypt, North Sini, Arish, See Street',
        timeSlots: ['7 am - 8 am', '8 am - 9 am'],
        day: "Saturday",
      ),
    );
  }

}

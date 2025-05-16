import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_card_updated.dart';

class CurrentBookingsView extends StatelessWidget {
  const CurrentBookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: customAppBar(title: AppStrings.booking),
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
            btnName2: AppStrings.completed,
            onPressed2: () {},
          ),
        ],
      ),
    );
  }
}

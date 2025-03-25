import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/booking_confirmation_card.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';

class CurrentBookingsView extends StatelessWidget {
  const CurrentBookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppStrings.appBarCurrentBookingsTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        child: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: List.generate(
              6,
              (index) => Column(
                children: [
                  const BookingConfirmationCard(),
                  if (index < 5)
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 16,
                      endIndent: 16,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

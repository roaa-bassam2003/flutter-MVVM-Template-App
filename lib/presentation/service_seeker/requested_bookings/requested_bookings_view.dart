import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/cancel_booking_confirmation_card.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';

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
                  const CancelBookingConfirmationCard(),
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

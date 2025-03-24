import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

import 'widgets/custom_notification_card.dart';

class NotificationsView extends StatelessWidget {
  final List<NotificationModel> notifications = [
    NotificationModel(
      title: "Your Booking is approved:",
      message:
          "category: nurse\nname: Kilani Githam\nPlease click to proceed to pay or the booking will be cancelled! 60:00",
      category: "nurse",
      name: "Kilani Githam",
      timer: "60:00",
      isApproved: true,
    ),
    NotificationModel(
      title:
          "You have cancel 5 services this will affect your account, so please before booking make sure about your needs.",
      message:
          "this is the first warn you can cancel up to 15 services after that your account will be deleted!",
      category: "nurse",
      name: "Kilani Githam",
      timer: null,
      isApproved: false,
      cancelCount: 5,
    ),
    NotificationModel(
      title: "Your Booking is not approved:",
      message:
          "category: nurse\nname: Kilani Githam\nYou can book other service provider",
      category: "nurse",
      name: "Kilani Githam",
      timer: null,
      isApproved: false,
    ),
  ];

  NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Center(
                child: Text(
                  AppStrings.appBarNotificationsTitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // List of Notifications
              ListView.builder(
                shrinkWrap:
                    true, // Allows the ListView to take only the space it needs
                physics:
                    const NeverScrollableScrollPhysics(), // Disables inner scrolling
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return CustomNotificationCard(
                      notification: notifications[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

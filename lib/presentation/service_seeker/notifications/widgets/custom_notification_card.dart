// Example in Flutter-like syntax
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:iconsax/iconsax.dart';

class CustomNotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const CustomNotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        shadowColor: ColorManager.white,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon based on notification type
              Container(
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                  color: notification.isApproved
                      ? ColorManager.lightPrimary
                      : ColorManager.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  notification.isApproved ? Icons.check : Iconsax.danger,
                  color: notification.isApproved
                      ? ColorManager.green
                      : ColorManager.error,
                  size: AppSize.s20,
                ),
              ),
              const SizedBox(width: AppSize.s16),
              // Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.s12,
                      ),
                    ),
                    Text(
                      notification.message,
                      style: TextStyle(
                        fontSize: AppSize.s14,
                        color: ColorManager.grey,
                      ),
                    ),
                    if (notification.timer != null)
                      Text(
                        "Time left: ${notification.timer}",
                        style: TextStyle(
                          color: ColorManager.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

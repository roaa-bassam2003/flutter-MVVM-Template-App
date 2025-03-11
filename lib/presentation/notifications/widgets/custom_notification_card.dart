// Example in Flutter-like syntax
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/domain/common_models.dart';
import 'package:flutter_advanced_course/presentation/resources/common/color_manager.dart';
import 'package:iconsax/iconsax.dart';

class CustomNotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const CustomNotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print("Tapped on notification: ${notification.title}");
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // زوايا دائرية
          side: BorderSide(
            color: ColorManager.primary,
            width: 2,
          ),
        ),
        shadowColor: ColorManager.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon based on notification type
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: notification.isApproved
                      ? Colors.green[100]
                      : Colors.yellow[100],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  notification.isApproved ? Icons.check : Iconsax.danger,
                  color: notification.isApproved ? Colors.green : Colors.red,
                  size: 20.0,
                ),
              ),
              const SizedBox(width: 16.0), // Spacing between icon and text
              // Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                    Text(
                      notification.message,
                      style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                    ),
                    if (notification.timer != null)
                      Text(
                        "Time left: ${notification.timer}",
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
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

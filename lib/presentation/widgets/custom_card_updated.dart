import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_pair_button.dart';

class CustomCardUpdated extends StatelessWidget {
  final String name;
  final String day;
  final String location;
  final List<String> timeSlots;

  final String btnName1;
  final VoidCallback onPressed1;
  final String? btnName2;
  final VoidCallback? onPressed2;

  const CustomCardUpdated({
    super.key,
    required this.name,
    required this.day,
    required this.location,
    required this.timeSlots,
    required this.btnName1,
    required this.onPressed1,
    this.btnName2,
    this.onPressed2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: AppSize.s8, horizontal: AppSize.s16),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: AppSize.s10,
            offset: const Offset(AppSize.s0, AppSize.s2),
          ),
        ],
        border: Border.all(color: ColorManager.lightGrey2),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSize.s16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Client name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(AppSize.s8),
                          decoration: BoxDecoration(
                            color: ColorManager.lightPrimary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            size: AppSize.s18,
                            color: ColorManager.primary,
                          ),
                        ),
                        const SizedBox(width: AppSize.s12),
                        Text(
                          name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: AppSize.s12),

                // Location
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: AppSize.s16,
                      color: ColorManager.grey,
                    ),
                    const SizedBox(width: AppSize.s8),
                    Expanded(
                      child: Text(
                        location,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppSize.s12),

                // Day
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: AppSize.s16,
                      color: ColorManager.grey,
                    ),
                    const SizedBox(width: AppSize.s8),
                    Text(
                      day,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),

                // Time slots
                Padding(
                  padding:
                      const EdgeInsets.only(left: AppSize.s24, top: AppSize.s8),
                  child: Column(
                    children: timeSlots.map((timeSlot) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSize.s8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: AppSize.s16,
                              color: ColorManager.grey,
                            ),
                            const SizedBox(width: AppSize.s8),
                            Text(
                              timeSlot,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: CustomPairButton(
              btnName1: btnName1,
              onPressed1: onPressed1,
              btnName2: btnName2,
              onPressed2: onPressed2,
            ),
          ),
        ],
      ),
    );
  }
}

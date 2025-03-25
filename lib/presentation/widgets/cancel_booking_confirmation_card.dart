import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

class CancelBookingConfirmationCard extends StatelessWidget {
  const CancelBookingConfirmationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s12),
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kalini Jithma',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Egypt, North Sini, Arish, See Street',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                'Saturday :\n7 am - 8 am\n8 am - 9 am',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: AppSize.s12,
              ),
              SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(
                            color: ColorManager.primary,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p16,
                            vertical: AppPadding.p16,
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

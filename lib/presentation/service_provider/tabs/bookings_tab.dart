import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

class BookingsTab extends StatefulWidget {
  const BookingsTab({super.key});

  @override
  State<BookingsTab> createState() => _BookingsTabState();
}

class _BookingsTabState extends State<BookingsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: List.generate(
          6,
          (index) => Column(
            children: [
              _card(),
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
    );
  }

  Widget _card() {
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
              Row(
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
                  const SizedBox(width: AppSize.s12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p16,
                          vertical: AppPadding.p16,
                        ),
                      ),
                      child: Text(
                        'Done',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
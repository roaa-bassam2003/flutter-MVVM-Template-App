import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        child: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              6,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
            ],
          ),
        ],
      ),
    );
  }
}

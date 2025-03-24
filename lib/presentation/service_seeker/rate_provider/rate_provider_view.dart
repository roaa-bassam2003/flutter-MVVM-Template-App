import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';

import '../../resources/color_manager.dart';

class RateProviderView extends StatelessWidget {
  const RateProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = ModalRoute.of(context)!.settings.arguments as Provider;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppStrings.rate),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        child: Column(
          children: [
            const SizedBox(height: AppSize.s16),

            // الصورة
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(provider.imagePath),
                backgroundColor: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: AppSize.s16),

            Text(
              provider.name,
              style: const TextStyle(
                fontSize: AppSize.s20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSize.s4),
            Text(
              provider.providerId,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: AppSize.s14,
              ),
            ),
            const SizedBox(height: AppSize.s16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text(AppStrings.rateYourExperience)],
            ),
            const SizedBox(height: AppSize.s16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Icon(
                  index < provider.rating.floor()
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                  size: 30,
                );
              }),
            ),
            const SizedBox(height: AppSize.s16),
            CustomButton(
              text: AppStrings.submit,
              onPressed: () {},
              backgroundColor: ColorManager.primary,
            )
          ],
        ),
      ),
    );
  }
}

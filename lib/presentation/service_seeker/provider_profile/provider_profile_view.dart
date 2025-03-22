import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/data/dummy_data/dummy_data.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/presentation/resources/common/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';

class ProviderProfileView extends StatelessWidget {
  const ProviderProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = ModalRoute.of(context)!.settings.arguments as Provider;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        title: 'Preview',
        isIcon: true,
        iconButton: IconButton(
          icon: const Icon(Icons.report_outlined),
          onPressed: () {
            Navigator.pushNamed(context, Routes.reportProviderRoute,
                arguments: provider);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصورة
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(provider.imagePath),
                backgroundColor: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: AppSize.s16),
            Center(
              child: Column(
                children: [
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < provider.rating.floor()
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 22,
                          );
                        }),
                      ),
                      // const SizedBox(width: AppSize.s8),
                      Text(
                        '${provider.price} LE/hr',
                        style: TextStyle(
                          color: ColorManager.primary,
                          // fontSize: AppSize.s16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSize.s16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  provider.location,
                  style: TextStyle(
                    color: ColorManager.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s16),
            // الأيام المتاحة
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: weekDays.map((day) {
                // Check if the day is in the provider's available days
                bool isAvailable = provider.availableDays.contains(day);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorManager
                            .primary, // Border color is always purple
                        width: 2, // Border thickness
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 12, // Circle size
                      backgroundColor:
                          isAvailable ? Colors.white : ColorManager.primary,
                      child: Text(
                        day[0],
                        style: TextStyle(
                          color:
                              isAvailable ? ColorManager.primary : Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.rateProviderRoute,
                    arguments: provider);
              },
              text: AppStrings.rate,
              backgroundColor: ColorManager.darkBlue,
            ),
            const SizedBox(height: 10),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.bookHoursProviderRoute,
                    arguments: provider);
              },
              text: AppStrings.book,
              backgroundColor: ColorManager.primary,
            ),
          ],
        ),
      ),
    );
  }
}

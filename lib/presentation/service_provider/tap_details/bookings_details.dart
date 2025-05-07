import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_pair_button.dart';
import 'package:iconsax/iconsax.dart';

class BookingsDetails extends StatelessWidget {
  const BookingsDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        title: AppStrings.preview,
        isIcon: true,
        iconButton: IconButton(
          icon: const Icon(Icons.report_outlined),
          onPressed: () {
            Navigator.pushNamed(context, Routes.reportProviderRoute);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // الصورة
            // Profile Picture
            const CircleAvatar(
              radius: AppSize.s60,
              backgroundImage: AssetImage('assets/images/person.jpg'),
            ),
            const SizedBox(height: AppSize.s16),
            Center(
              child: Column(
                children: [
                  // User Name
                  Text(
                    'Mohamed Hassan',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  // User Handle
                  Text(
                    '@ss_2025',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.location,
                        color: ColorManager.primary,
                      ),
                      const SizedBox(
                        width: AppSize.s1_5,
                      ),
                      Text(
                        "Egypt, North Sini, Arish, See Street",
                        style: TextStyle(
                          color: ColorManager.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildBookingsContainer(
                    title: AppStrings.booking,
                    boxColor: ColorManager.lightPrimary,
                    subTitle: "80%",
                    subTitleColor: ColorManager.primary,
                  ),
                  const SizedBox(
                    width: AppSize.s12,
                  ),
                  _buildBookingsContainer(
                    title: AppStrings.cancellations,
                    boxColor: ColorManager.lightRed,
                    subTitle: "34%",
                    subTitleColor: ColorManager.error,
                  ),
                  const SizedBox(
                    width: AppSize.s12,
                  ),
                  _buildBookingsContainer(
                    title: AppStrings.reports,
                    boxColor: ColorManager.lightGrey2,
                    subTitle: "1%",
                    subTitleColor: ColorManager.grey,
                  )
                ],
              ),
            ),
            const SizedBox(height: AppSize.s16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.clock,
                  color: ColorManager.darkBlue,
                ),
                const SizedBox(
                  width: AppSize.s3,
                ),
                Text(
                  "${AppStrings.bookedTimeSlotsOn} Saturday",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _timeSlotContainer(context, "7 am - 8 am"),
                  _timeSlotContainer(context, "8 am - 9 am"),
                  _timeSlotContainer(context, "9 am - 10 am"),
                  _timeSlotContainer(context, "10 am - 11 am"),
                ],
              ),
            ),

            const SizedBox(height: AppSize.s16),

            CustomPairButton(
              btnName1: AppStrings.cancelled,
              onPressed1: () {
                // Handle cancel
              },
              btnName2: AppStrings.completed,
              onPressed2: () {
                // Handle done
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _timeSlotContainer(BuildContext context, String slot) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.lightGrey2,
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
          vertical: AppPadding.p8,
        ),
        child: Text(
          slot,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }

  Widget _buildBookingsContainer({
    required String title,
    required Color boxColor,
    required Color subTitleColor,
    required String subTitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
          vertical: AppPadding.p8,
        ),
        child: Column(
          children: [
            Text(
              title,
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: subTitleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

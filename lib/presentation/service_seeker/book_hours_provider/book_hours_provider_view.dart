import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/data/dummy_data/dummy_data.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';

class BookHoursProviderView extends StatefulWidget {
  const BookHoursProviderView({super.key});

  @override
  State<BookHoursProviderView> createState() => _BookHoursProviderViewState();
}

class _BookHoursProviderViewState extends State<BookHoursProviderView> {
  // State variables
  String? selectedDay; // To track the selected day
  List<String> selectedHours = []; // To track selected hours

  @override
  Widget build(BuildContext context) {
    // Fetch the provider data from ModalRoute
    final provider = ModalRoute.of(context)!.settings.arguments as Provider;

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: customAppBar(title: AppStrings.bookHours),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Days Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: weekDays.map((day) {
                bool isAvailable = provider.availableDays.contains(day);
                bool isSelected = selectedDay == day;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p3,
                  ),
                  child: GestureDetector(
                    onTap: isAvailable
                        ? () {
                            setState(() {
                              selectedDay = day;
                              selectedHours
                                  .clear(); // Reset hours when a new day is selected
                            });
                          }
                        : null, // Disable tap for unavailable days
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ColorManager.primary,
                          width: AppSize.s2,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: AppSize.s12,
                        backgroundColor: isSelected
                            ? ColorManager.lightGrey
                            : (isAvailable
                                ? ColorManager.white
                                : ColorManager.primary),
                        child: Text(
                          day[0],
                          style: TextStyle(
                            color: isAvailable
                                ? ColorManager.primary
                                : ColorManager.white,
                            fontSize: AppSize.s12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: AppSize.s20),

            // Available Hours Section
            if (selectedDay != null &&
                provider.availableHours.containsKey(selectedDay)) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.availableHours,
                    style: TextStyle(
                      fontSize: AppSize.s16,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primary,
                    ),
                  ),
                  Text(
                    ' $selectedDay',
                    style: TextStyle(
                      fontSize: AppSize.s16,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s10),
              // Display available hours for the selected day
              ...provider.availableHours[selectedDay]!.map((hour) {
                bool isHourSelected = selectedHours.contains(hour);
                return CheckboxListTile(
                  title: Text(hour),
                  value: isHourSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        selectedHours.add(hour);
                      } else {
                        selectedHours.remove(hour);
                      }
                    });
                  },
                );
              })
            ],
            const SizedBox(height: AppSize.s10),
            CustomButton(
              text: AppStrings.submit,
              onPressed: () {
                if (selectedDay == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(AppStrings.bookHoursSelectADayFirst),
                      duration: const Duration(seconds: 2),
                      backgroundColor: ColorManager.error,
                    ),
                  );
                  return;
                }

                if (selectedHours.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(AppStrings.selectTimeSlot),
                      duration: const Duration(seconds: 2),
                      backgroundColor: ColorManager.error,
                    ),
                  );
                  return;
                }

                // If validation passes
                // Navigator.pushNamed(context, Routes.paymentRoute);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(AppStrings.bookingSuccess),
                    duration: const Duration(seconds: 5),
                    backgroundColor: ColorManager.green,
                  ),
                );
              },
              backgroundColor: ColorManager.primary,
            )
          ],
        ),
      ),
    );
  }
}

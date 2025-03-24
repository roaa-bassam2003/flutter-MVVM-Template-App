import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/data/dummy_data/dummy_data.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
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
      backgroundColor: Colors.white,
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
                  padding: const EdgeInsets.symmetric(horizontal: 3),
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
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: isSelected
                            ? ColorManager.lightGrey
                            : (isAvailable
                                ? Colors.white
                                : ColorManager.primary),
                        child: Text(
                          day[0],
                          style: TextStyle(
                            color: isAvailable
                                ? ColorManager.primary
                                : Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Available Hours Section
            if (selectedDay != null &&
                provider.availableHours.containsKey(selectedDay)) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.availableHours,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.primary,
                    ),
                  ),
                  Text(
                    ' $selectedDay',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
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
            const SizedBox(height: 10),
            CustomButton(
              text: AppStrings.submit,
              onPressed: () {
                if (selectedDay == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select a day first!'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                if (selectedHours.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(AppStrings.selectTimeSlot),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                // If validation passes
                print('Selected Day: $selectedDay');
                print('Selected Hours: $selectedHours');
                Navigator.pushNamed(context, Routes.paymentRoute);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(AppStrings.bookingSuccess),
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.green,
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

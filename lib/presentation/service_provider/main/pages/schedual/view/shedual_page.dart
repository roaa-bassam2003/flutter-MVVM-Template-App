import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/app_prefs.dart';
import 'package:flutter_advanced_course/app/di.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/service_provider/day_specification/day_specification.dart';

class ShedualPage extends StatefulWidget {
  const ShedualPage({super.key});

  @override
  State<ShedualPage> createState() => _DaysScheduleViewState();
}

class _DaysScheduleViewState extends State<ShedualPage> {
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final AppPrefs _appPrefs = instance<AppPrefs>();
  Map<String, List<String>> _daysWithHours = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAllDaysHours();
  }

  Future<void> _loadAllDaysHours() async {
    Map<String, dynamic> dayHoursMap = await _appPrefs.getDayHoursMap();
    Map<String, List<String>> result = {};

    for (String day in days) {
      if (dayHoursMap.containsKey(day)) {
        List<dynamic> hoursDynamic = dayHoursMap[day] as List<dynamic>;
        result[day] = hoursDynamic.map((hour) => hour.toString()).toList();
      } else {
        result[day] = [];
      }
    }

    setState(() {
      _daysWithHours = result;
      _isLoading = false;
    });
  }

  // Check if any hours are selected across all days
  bool _hasAnyHoursSelected() {
    for (String day in days) {
      List<String> hours = _daysWithHours[day] ?? [];
      if (hours.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // Check if any hours are selected to enable/disable the clear button
    bool hasSelectedHours = _hasAnyHoursSelected();

    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: AppPadding.p8, right: AppPadding.p8),
                // child: Text(
                //   'Select a day to set your available hours',
                //   style: Theme.of(context)
                //       .textTheme
                //       .bodyMedium
                //       ?.copyWith(color: ColorManager.primary),
                // ),
              ),
              // Days list
              ...days.map((day) {
                List<String> hours = _daysWithHours[day] ?? [];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: AppSize.s16,
                    vertical: AppSize.s16,
                  ),
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      day,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: hours.isEmpty
                        ? Text(
                            'No hours selected',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: AppSize.s4),
                              Text(
                                'Selected hours: ${hours.length}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              if (hours.isNotEmpty)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: AppSize.s4),
                                  child: Wrap(
                                    spacing: AppSize.s4,
                                    children: hours.take(2).map((hour) {
                                          return Chip(
                                            label: Text(
                                              hour,
                                              style:
                                                  const TextStyle(fontSize: 10),
                                            ),
                                            backgroundColor:
                                                ColorManager.lightPrimary,
                                            padding: EdgeInsets.zero,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: BorderSide(
                                                color:
                                                    ColorManager.lightPrimary,
                                                width: 1.0,
                                              ),
                                            ),
                                          );
                                        }).toList() +
                                        (hours.length > 2
                                            ? [
                                                Chip(
                                                  label: Text(
                                                    "+${hours.length - 2} more",
                                                    style: const TextStyle(
                                                        fontSize: 10),
                                                  ),
                                                  backgroundColor:
                                                      ColorManager.lightGrey,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    side: BorderSide(
                                                      color: ColorManager
                                                          .lightGrey,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                )
                                              ]
                                            : []),
                                  ),
                                ),
                            ],
                          ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: ColorManager.primary,
                    ),
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DaySpecification(selectedDay: day),
                        ),
                      );

                      // If changes were made, reload the data
                      if (result == true) {
                        _loadAllDaysHours();
                      }
                    },
                  ),
                );
              }).toList(),

              // Clear All Button at the end of the list
              Padding(
                padding: const EdgeInsets.all(AppSize.s16),
                child: ElevatedButton(
                  onPressed: hasSelectedHours
                      ? () async {
                          // Show dialog to confirm
                          bool? shouldClear = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Clear All Hours'),
                              content: const Text(
                                  'Are you sure you want to clear all selected hours for all days?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: const Text('CANCEL'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: const Text('CLEAR ALL'),
                                ),
                              ],
                            ),
                          );

                          if (shouldClear == true) {
                            await _appPrefs.clearAllDayHours();
                            _loadAllDaysHours();
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      const Text('All hours have been cleared'),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: ColorManager.green,
                                ),
                              );
                            }
                          }
                        }
                      : null, // Disable the button when no hours are selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary,
                    minimumSize: const Size(double.infinity, AppSize.s48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                    ),
                    // The button automatically applies a disabled style when onPressed is null
                    disabledBackgroundColor: ColorManager.lightGrey,
                    disabledForegroundColor:
                        ColorManager.white.withOpacity(0.5),
                  ),
                  child: Text(
                    'Clear All Hours',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorManager.white,
                        ),
                  ),
                ),
              ),
              // Add some padding at the bottom for better scrolling experience
              const SizedBox(height: AppSize.s16),
            ],
          );
  }
}

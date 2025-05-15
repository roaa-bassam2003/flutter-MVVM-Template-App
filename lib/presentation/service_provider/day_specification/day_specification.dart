import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/app_prefs.dart';
import 'package:flutter_advanced_course/app/di.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import '../../resources/color_manager.dart';

class DaySpecification extends StatefulWidget {
  final String selectedDay;

  const DaySpecification({super.key, required this.selectedDay});

  @override
  State<DaySpecification> createState() => _DaySpecificationState();
}

class _DaySpecificationState extends State<DaySpecification> {
  late List<bool> _selectedHours;
  final List<String> _hours = AppPrefs.hoursList;
  final AppPrefs _appPrefs = instance<AppPrefs>();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Initialize with all false, then load saved selections
    _selectedHours = List.generate(_hours.length, (index) => false);
    _loadSavedHours();
  }

  Future<void> _loadSavedHours() async {
    // Get the saved selected hours for this day
    Map<String, dynamic> dayHoursMap = await _appPrefs.getDayHoursMap();

    if (dayHoursMap.containsKey(widget.selectedDay)) {
      List<dynamic> hoursDynamic =
          dayHoursMap[widget.selectedDay] as List<dynamic>;
      List<String> savedHours =
          hoursDynamic.map((hour) => hour.toString()).toList();

      // Update the selected hours list
      for (int i = 0; i < _hours.length; i++) {
        if (savedHours.contains(_hours[i])) {
          _selectedHours[i] = true;
        }
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text(
          widget.selectedDay,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        automaticallyImplyLeading: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Choose your available hours',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _hours.length,
                    itemBuilder: (context, index) => CheckboxListTile(
                      title: Text(
                        _hours[index],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      value: _selectedHours[index],
                      onChanged: (bool? value) {
                        setState(() {
                          _selectedHours[index] = value ?? false;
                        });
                      },
                      activeColor: ColorManager.blue,
                      checkColor: ColorManager.white,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Save the selected hours for this day
                      await _appPrefs.saveDayHours(
                          widget.selectedDay, _selectedHours, _hours);

                      if (mounted) {
                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Hours saved successfully!'),
                            duration: const Duration(seconds: 2),
                            backgroundColor: ColorManager.green,
                          ),
                        );
                        Navigator.pop(context,
                            true); // Return true to indicate changes were made
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primary,
                      minimumSize: const Size(double.infinity, AppSize.s48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

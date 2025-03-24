import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class DaySpecification extends StatefulWidget {
  final String selectedDay;

  const DaySpecification({super.key, required this.selectedDay});

  @override
  State<DaySpecification> createState() => _DaySpecificationState();
}

class _DaySpecificationState extends State<DaySpecification> {
  late List<bool> _selectedHours;

  // قائمة ثابتة من 1 إلى 24
  final List<String> _hours = [
    '12 am - 1 am',
    '1 am - 2 am',
    '2 am - 3 am',
    '3 am - 4 am',
    '4 am - 5 am',
    '5 am - 6 am',
    '6 am - 7 am',
    '7 am - 8 am',
    '8 am - 9 am',
    '9 am - 10 am',
    '10 am - 11 am',
    '11 am - 12 pm',
    '12 pm - 1 pm',
    '1 pm - 2 pm',
    '2 pm - 3 pm',
    '3 pm - 4 pm',
    '4 pm - 5 pm',
    '5 pm - 6 pm',
    '6 pm - 7 pm',
    '7 pm - 8 pm',
    '8 pm - 9 pm',
    '9 pm - 10 pm',
    '10 pm - 11 pm',
    '11 pm - 12 am',
  ];

  @override
  void initState() {
    super.initState();
    // تهيئة القائمة بـ 24 عنصر (كلهم false في البداية)
    _selectedHours = List.generate(24, (index) => false);
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
      body: Column(
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
              itemCount: _hours.length, // 24 ساعة
              itemBuilder: (context, index) => CheckboxListTile(
                title: Text(
                  _hours[index], // الساعة من القائمة الثابتة
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                value: _selectedHours[index],
                onChanged: (bool? value) {
                  setState(() {
                    _selectedHours[index] = value ?? false;
                  });
                },
                activeColor: ColorManager.blue,
                checkColor: ColorManager.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primary,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
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

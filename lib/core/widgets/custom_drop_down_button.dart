import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/common/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedValue; // القيمة المختارة
  final List<String> items = [
    'Pet Care',
    'Nurse',
    'Elderly Care',
    'Babysitter'
  ]; // الخيارات

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ColorManager.darkBlue, // لون الخلفية الداكن
        borderRadius: BorderRadius.circular(AppPadding.p8), // تدوير الحواف
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min, // تمنع الـ Row من التمدد بالكامل
            children: [
              Text(
                'Select',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5), // مسافة بين النص والسهم
              Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
          icon: const SizedBox(),
          dropdownColor: ColorManager.darkBlue, // لون القائمة المنسدلة
          style:
              const TextStyle(color: Colors.white), // لون النصوص داخل القائمة
          isExpanded: true, // يملأ العرض بالكامل
          borderRadius: BorderRadius.circular(12), // تدوير القائمة المنسدلة
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

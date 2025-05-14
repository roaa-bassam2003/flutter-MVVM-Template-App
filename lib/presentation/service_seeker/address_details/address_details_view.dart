import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/data/dummy_data/government_city.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/report_provider/widgets/custom_static_field.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_drop_down_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';

class AddressDetailsView extends StatefulWidget {
  const AddressDetailsView({super.key});

  @override
  State<AddressDetailsView> createState() => _AddressDetailsViewState();
}

class _AddressDetailsViewState extends State<AddressDetailsView> {
  String? selectedGovernorate;
  String? selectedCity;
  String? selectedDay;
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addressController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  // التحقق من اكتمال البيانات
  bool get isFormComplete {
    return selectedGovernorate != null &&
        selectedCity != null &&
        selectedDay != null &&
        _addressController.text.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final String? serviceName =
        ModalRoute.of(context)!.settings.arguments as String?;

    if (serviceName == null) {
      return const Scaffold(
        body: Center(
          child: Text('Error: Please select a service first.'),
        ),
      );
    }

    final List<String> days = [
      'Saturday',
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
    ];

    // استخراج المدن بناءً على المحافظة المختارة
    List<String> cities = [];
    if (selectedGovernorate != null) {
      final governorateData = governoratesWithCities
          .firstWhere((item) => item['governorate'] == selectedGovernorate);
      cities = List<String>.from(governorateData['cities']);
    }

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: customAppBar(title: 'Address'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Column(
          children: [
            Text(
              AppStrings.addressDetailsLabel,
              style: TextStyle(
                color: ColorManager.primary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // static for country
            const CustomStaticField(
              label: "Egypt",
            ),
            const SizedBox(height: 10),
            // Dropdown للمحافظة
            CustomDropdownButton(
              textColor: ColorManager.grey,
              backgroundColor: ColorManager.white,
              borderColor: ColorManager.lightGrey,
              hint: AppStrings.governorate,
              items: governoratesWithCities
                  .map((item) => item['governorate'] as String)
                  .toList(),
              selectedValue: selectedGovernorate,
              onChanged: (value) {
                setState(() {
                  selectedGovernorate = value;
                  selectedCity = null; // إعادة تعيين المدينة
                });
              },
            ),
            const SizedBox(height: 10),
            // Dropdown للمدينة
            CustomDropdownButton(
              textColor: ColorManager.grey,
              backgroundColor: ColorManager.white,
              borderColor: ColorManager.lightGrey,
              hint: AppStrings.city,
              items: cities,
              selectedValue: selectedCity,
              onChanged: (value) {
                setState(() {
                  selectedCity = value;
                });
              },
            ),
            const SizedBox(height: 10),
            // Dropdown للأيام
            CustomDropdownButton(
              textColor: ColorManager.grey,
              backgroundColor: ColorManager.white,
              borderColor: ColorManager.lightGrey,
              hint: AppStrings.day,
              items: days,
              selectedValue: selectedDay,
              onChanged: (value) {
                setState(() {
                  selectedDay = value;
                });
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              hintText: 'Address',
              labelText: 'Address',
              textInputType: TextInputType.text,
              controller: _addressController,
            ),
            const SizedBox(height: 20),
            // زر الانتقال - باستخدام CustomButton
            CustomButton(
              onPressed: isFormComplete
                  ? () {
                      Navigator.pushNamed(
                        context,
                        Routes.serviceProvidersRoute,
                        arguments: {
                          'serviceName': serviceName,
                          'governorate': selectedGovernorate,
                          'city': selectedCity,
                          'day': selectedDay,
                          'address': _addressController.text.trim(),
                        },
                      );
                    }
                  : null,
              text: 'Next',
              backgroundColor:
                  isFormComplete ? ColorManager.primary : ColorManager.grey,
            ),
          ],
        ),
      ),
    );
  }
}

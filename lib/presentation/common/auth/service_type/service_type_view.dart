import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_drop_down_button.dart';
import 'package:flutter_advanced_course/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

class ServiceTypeView extends StatefulWidget {
  const ServiceTypeView({super.key});

  @override
  State<ServiceTypeView> createState() => _ServiceTypeViewState();
}

class _ServiceTypeViewState extends State<ServiceTypeView> {
  int _selectedIndex = -1;

  final List<String> _serviceTypes = [
    'Babysitter',
    'Petsitter',
    'Nurse',
    'HouseKeeper',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: Column(
          children: [
            //Logo
            Center(
              child: Image.asset(
                ImageAssets.splashLogo,
                width: 200,
                height: 200,
              ),
            ),
            const Text(
              AppStrings.serviceTypeQuestion,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 50),

            CustomDropdownButton(
              fontWeight: false,
              backgroundColor: ColorManager.white,
              textColor: ColorManager.primary,
              iconColor: ColorManager.primary,
              borderColor: ColorManager.primary,
              hint: AppStrings.selectService,
              items: _serviceTypes,
              onChanged: (value) {
                final newIndex = _serviceTypes.indexOf(value!);

                setState(() {
                  _selectedIndex = newIndex;
                });
              },
            ),
            // space
            const SizedBox(height: 18),
            //Continue Button
            CustomButton(
              onPressed: () {
                if (_selectedIndex != -1) {
                  final arguments = {
                    'serviceType': _selectedIndex,
                  };

                  Navigator.pushNamed(
                    context,
                    Routes.registerProviderRoute,
                    arguments: arguments,
                  );
                } else {
                  // if nothing selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select a service type'),
                    ),
                  );
                }
              },
              text: AppStrings.continueButton,
              backgroundColor: ColorManager.primary,
            ),
          ],
        ),
      ),
    );
  }
}

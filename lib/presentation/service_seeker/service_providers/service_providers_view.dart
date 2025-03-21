import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/data/dummy_data/dummy_data.dart';
import 'package:flutter_advanced_course/presentation/resources/common/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/service_providers/widgets/provider_card.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_drop_down_button.dart';

class ServiceProvidersView extends StatelessWidget {
  const ServiceProvidersView({super.key});

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
    final selectedService =
        services.firstWhere((service) => service.name == serviceName);
    final List<String> cities = [
      'Low',
      'High',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        title: 'Get $serviceName',
        isIcon: true,
        iconButton: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => Navigator.pushNamed(context, Routes.searchRoute),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomDropdownButton(
                    textColor: ColorManager.grey,
                    backgroundColor: ColorManager.white,
                    borderColor: ColorManager.lightGrey,
                    hint: AppStrings.price,
                    items: cities,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: CustomDropdownButton(
                    textColor: ColorManager.grey,
                    backgroundColor: ColorManager.white,
                    borderColor: ColorManager.lightGrey,
                    hint: AppStrings.rate,
                    items: cities,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get $serviceName',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  selectedService.imagePath,
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error, size: 30);
                  },
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: selectedService.providers.length,
                itemBuilder: (context, index) {
                  final provider = selectedService.providers[index];
                  return ProviderCard(
                    onTap: () => Navigator.pushNamed(
                        context, Routes.providerProfileRoute,
                        arguments: provider),
                    provider: provider,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/data/dummy_data/dummy_data.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/service_providers/widgets/provider_card.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';

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

    return Scaffold(
      appBar: customAppBar(
        title: 'Get $serviceName',
        isIcon: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        child: Column(
          children: [
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
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: selectedService.providers.length,
                itemBuilder: (context, index) {
                  final provider = selectedService.providers[index];
                  return ProviderCard(
                    name: provider.name,
                    imagePath: provider.imagePath,
                    rating: provider.rating,
                    price: provider.price,
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

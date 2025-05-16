import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';

import '../../resources/color_manager.dart';

class RateProviderView extends StatefulWidget {
  const RateProviderView({super.key});

  @override
  State<RateProviderView> createState() => _RateProviderViewState();
}

class _RateProviderViewState extends State<RateProviderView> {
  int _selectedRating = 0;
  bool _isSubmitting = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final provider = ModalRoute.of(context)!.settings.arguments as Provider;
    const String providerName = "Provider Name";
    const String providerImagePath = "assets/images/person.jpg";
    const String providerId = "@sp_2025";
    const int providerRating = 4;

    // Initialize with provider's current rating if available
    if (_selectedRating == 0 && providerRating > 0) {
      _selectedRating = providerRating.floor();
    }

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: customAppBar(title: AppStrings.rate),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
          ),
          child: Column(
            children: [
              const SizedBox(height: AppSize.s24),

              // Provider image
              Center(
                child: CircleAvatar(
                  radius: AppSize.s70,
                  backgroundImage: const AssetImage(providerImagePath),
                  backgroundColor: ColorManager.grey,
                ),
              ),
              const SizedBox(height: AppSize.s16),

              // Provider name
              const Text(
                providerName,
                style: TextStyle(
                  fontSize: AppSize.s20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSize.s4),

              // Provider ID
              Text(
                providerId,
                style: TextStyle(
                  color: ColorManager.grey,
                  fontSize: AppSize.s14,
                ),
              ),
              const SizedBox(height: AppSize.s24),

              // Rating title
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.rateYourExperience,
                    style: TextStyle(
                      fontSize: AppSize.s16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s16),

              // Interactive star rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedRating = index + 1;
                      });
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                      child: Icon(
                        index < _selectedRating
                            ? Icons.star
                            : Icons.star_border,
                        color: ColorManager.myAmber,
                        size: AppSize.s36,
                      ),
                    ),
                  );
                }),
              ),

              // Rating text indicator
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                child: Text(
                  _getRatingText(),
                  style: TextStyle(
                    color: ColorManager.primary,
                    fontSize: AppSize.s14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s16),

              // Submit button
              _isSubmitting
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      text: AppStrings.submit,
                      onPressed: _selectedRating > 0 ? _submitRating : null,
                      backgroundColor: _selectedRating > 0
                          ? ColorManager.primary
                          : ColorManager.grey,
                    ),
              const SizedBox(height: AppSize.s24),
            ],
          ),
        ),
      ),
    );
  }

  String _getRatingText() {
    switch (_selectedRating) {
      case 1:
        return AppStrings.poor;
      case 2:
        return AppStrings.fair;
      case 3:
        return AppStrings.good;
      case 4:
        return AppStrings.veryGood;
      case 5:
        return AppStrings.excellent;
      default:
        return '';
    }
  }

  Future<void> _submitRating() async {
    if (_selectedRating == 0) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      // Here you would typically call a service to submit the rating
      // Example: await providerService.rateProvider(
      //   providerId: provider.providerId,
      //   rating: _selectedRating,
      //   comment: _commentController.text,
      // );

      // Simulate API call with delay
      await Future.delayed(const Duration(seconds: 1));

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(AppStrings.ratingSubmittedSuccessfully),
            backgroundColor: ColorManager.green,
          ),
        );

        // Navigate back after successful submission
        Navigator.of(context).pop();
      }
    } catch (e) {
      // Show error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppStrings.errorSubmittingRating}: $e'),
            backgroundColor: ColorManager.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }
}

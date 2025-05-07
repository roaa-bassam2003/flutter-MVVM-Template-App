import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

class CustomPairButton extends StatelessWidget {
  final String btnName1;
  final VoidCallback onPressed1;
  final String btnName2;
  final VoidCallback onPressed2;

  const CustomPairButton({
    super.key,
    required this.btnName1,
    required this.onPressed1,
    required this.btnName2,
    required this.onPressed2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onPressed1,
            style: OutlinedButton.styleFrom(
              backgroundColor: ColorManager.white,
              side: BorderSide(
                color: ColorManager.primary,
                width: 1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p16,
              ),
            ),
            child: Text(
              btnName1,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        const SizedBox(width: AppSize.s12),
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed2,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16,
                vertical: AppPadding.p16,
              ),
            ),
            child: Text(
              btnName2,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: ColorManager.white),
            ),
          ),
        ),
      ],
    );
  }
}

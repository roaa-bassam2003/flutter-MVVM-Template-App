import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/common/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppStrings.payment),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              AppStrings.paymentMethod,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            const CustomTextFormField(
              suffixIcon: Icon(Icons.payment),
              hintText: 'Card Number',
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'MM/YY',
                    textInputType: TextInputType.datetime,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'CVV',
                    textInputType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            CustomButton(
              text: AppStrings.pay,
              onPressed: () {},
              backgroundColor: ColorManager.darkGrey,
            )
          ],
        ),
      ),
    );
  }
}

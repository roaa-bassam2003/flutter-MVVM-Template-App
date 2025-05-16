import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: customAppBar(title: AppStrings.payment),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: Column(
          children: [
            const SizedBox(height: AppSize.s10),
            // const Text(
            //   AppStrings.paymentMethod,
            //   style: TextStyle(
            //     fontSize: 16,
            //   ),
            // ),
            const SizedBox(height: AppSize.s10),
            const CustomTextFormField(
              suffixIcon: Icon(Icons.payment),
              hintText: 'Card Number',
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: AppSize.s10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'MM/YY',
                    textInputType: TextInputType.datetime,
                  ),
                ),
                SizedBox(width: AppSize.s5),
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'CVV',
                    textInputType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s16),
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

import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/di.dart';
import 'package:flutter_advanced_course/presentation/common/auth/change_password/view_model/change_password_view_model.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordOneTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTwoTextEditingController =
      TextEditingController();
  final ChangePasswordViewModel _viewModel =
      instance<ChangePasswordViewModel>();

  bind() {
    _viewModel.start();
    _passwordOneTextEditingController.addListener(
      () => _viewModel.setPasswordOne(_passwordOneTextEditingController.text),
    );
    _passwordTwoTextEditingController.addListener(
      () => _viewModel.setPasswordTwo(_passwordTwoTextEditingController.text),
    );
  }

  @override
  void initState() {
    bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: customAppBar(title: AppStrings.appBarChangePasswordTitle),
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.changePassword();
                }) ??
                _getContentWidget();
          }),
    );
  }

  Widget _getContentWidget() {
    return Padding(
      padding: const EdgeInsets.all(
        AppPadding.p20,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<bool>(
                stream: _viewModel.outputIsPasswordOneValid,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                    hintText: AppStrings.oldPassword,
                    labelText: AppStrings.oldPassword,
                    textInputType: TextInputType.text,
                    controller: _passwordOneTextEditingController,
                    errorText: (snapshot.data ?? true)
                        ? null
                        : AppStrings.passwordError,
                  );
                }),
            const SizedBox(height: 10),
            StreamBuilder<bool>(
                stream: _viewModel.outputIsPasswordTwoValid,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                    labelText: AppStrings.currentPassword,
                    hintText: AppStrings.currentPassword,
                    textInputType: TextInputType.text,
                    controller: _passwordTwoTextEditingController,
                    errorText: (snapshot.data ?? true)
                        ? null
                        : AppStrings.passwordError,
                  );
                }),
            const SizedBox(height: 20),
            StreamBuilder<bool>(
                stream: _viewModel.outputIsAllInputValid,
                builder: (context, snapshot) {
                  return CustomButton(
                      onPressed: (snapshot.data ?? false)
                          ? () {
                              _viewModel.changePassword();
                              // Navigator.of(context).pushReplacementNamed(ProviderRoutes.mainRoute);
                            }
                          : null,
                      text: AppStrings.change,
                      backgroundColor: ColorManager.primary);
                }),
            const SizedBox(height: 5),
            // Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.forgotPasswordRoute);
                  },
                  text: AppStrings.forgotPassword,
                  textColor: ColorManager.darkGrey,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

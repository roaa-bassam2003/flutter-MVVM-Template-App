import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/app_prefs.dart';
import 'package:flutter_advanced_course/app/di.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_advanced_course/presentation/common/reset_passward/view_model/reset_password_view_model.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordOneTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTwoTextEditingController =
      TextEditingController();
  final ResetPasswordViewModel _viewModel = instance<ResetPasswordViewModel>();

  final AppPrefs _appPrefs = instance<AppPrefs>();

  bind() async {
    _viewModel.start();

    String? email = await _appPrefs.getEmail();
    String? token = await _appPrefs.getLoginToken();
    _viewModel.setEmail(email!);
    _viewModel.setToken(token!);

    _viewModel.isUserResetPasswordSuccessfullyStreamController.stream
        .listen((isLoggedIn) async {
      if (isLoggedIn) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
        });
      }
    });

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
      appBar: customAppBar(title: AppStrings.appBarResetPasswordTitle),
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
                    hintText: AppStrings.newPassword,
                    labelText: AppStrings.newPassword,
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
                    labelText: AppStrings.confirmedPassword,
                    hintText: AppStrings.confirmedPassword,
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
                            }
                          : null,
                      text: AppStrings.reset,
                      backgroundColor: ColorManager.primary);
                }),
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

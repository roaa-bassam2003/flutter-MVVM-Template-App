import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/app_prefs.dart';
import 'package:flutter_advanced_course/app/di.dart';
import 'package:flutter_advanced_course/presentation/common/auth/forgot_password/view_model/forgot_password_view_model.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter_advanced_course/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter/scheduler.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final ForgotPasswordViewModel _viewModel =
      instance<ForgotPasswordViewModel>();
  final AppPrefs _appPrefs = instance<AppPrefs>();

  bind() {
    _viewModel.start();
    _emailTextEditingController.addListener(
        () => _viewModel.setEmail(_emailTextEditingController.text));

    _viewModel.isUserForgetPasswordSuccessfullyStreamController.stream
        .listen((isLoggedIn) async{
      if (isLoggedIn) {
        String? token = _viewModel.getToken();
        _appPrefs.setLoginToken(token!);
        String? email = _viewModel.getEmail();
        _appPrefs.setEmail(email!);
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed(Routes.resetPasswordRoute);
        });
      }
    });
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
      appBar: customAppBar(),
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.forgotPassword();
                }) ??
                _getContentWidget();
          }),
    );
  }

  Padding _getContentWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
      ),
      child: Form(
        key: _formKey,
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
            //Username
            StreamBuilder<bool>(
                stream: _viewModel.outputIsEmailValid,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                    hintText: AppStrings.usernameOrEmail,
                    textInputType: TextInputType.emailAddress,
                    labelText: AppStrings.usernameOrEmail,
                    controller: _emailTextEditingController,
                    errorText: (snapshot.data ?? true)
                        ? null
                        : AppStrings.usernameError,
                  );
                }),
            // space
            const SizedBox(height: 20),
            //Login
            StreamBuilder<bool>(
                stream: _viewModel.outputIsAllInputValid,
                builder: (context, snapshot) {
                  return CustomButton(
                    onPressed: (snapshot.data ?? false)
                        ? () {
                            _viewModel.forgotPassword();
                          }
                        : null,
                    text: AppStrings.send,
                    backgroundColor: ColorManager.primary,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

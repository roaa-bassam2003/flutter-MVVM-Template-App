import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_advanced_course/app/app_prefs.dart';
import 'package:flutter_advanced_course/app/di.dart';
import 'package:flutter_advanced_course/presentation/common/auth/login/view_model/login_view_model.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter_advanced_course/presentation/resources/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AppPrefs _appPrefs = instance<AppPrefs>();
  var userName = "";

  _bind() {
    _viewModel.start(); // tell view model: start your job
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isLoggedIn) {
      if (isLoggedIn) {
        userName = _viewModel.getUserType();
        // navigate to main screen
        // save in app Prefs
        _appPrefs.setIsUserLoggedIn();
        _appPrefs.logoutDeleteAccount();
        String? token = _viewModel.getToken();
        _appPrefs.setLoginToken(token!);
        _appPrefs.setUserName(userName);
        if (userName == "ServiceProvider") {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context)
                .pushReplacementNamed(ProviderRoutes.mainRoute);
          });
        } else if (userName == "Client") {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
          });
        }
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(
                  context,
                  _getContentWidget(),
                  () {
                    _viewModel.login();
                  },
                ) ??
                _getContentWidget();
          }),
    );
  }

  Widget _getContentWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //Space
              const SizedBox(height: 70),
              //Logo
              Center(
                child: Image.asset(
                  ImageAssets.splashLogo,
                  width: AppSize.s200,
                  height: AppSize.s200,
                ),
              ),
              //Username
              StreamBuilder<bool>(
                stream: _viewModel.outIsUserNameValid,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                    hintText: AppStrings.usernameOrEmail,
                    labelText: AppStrings.usernameOrEmail,
                    textInputType: TextInputType.emailAddress,
                    controller: _userNameController,
                    errorText: (snapshot.data ?? true)
                        ? null
                        : AppStrings.usernameError,
                  );
                },
              ),
              // space
              const SizedBox(height: 10),
              //password
              StreamBuilder<bool>(
                stream: _viewModel.outIsPasswordValid,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                    hintText: AppStrings.password,
                    labelText: AppStrings.password,
                    textInputType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    errorText: (snapshot.data ?? true)
                        ? null
                        : AppStrings.passwordError,
                  );
                },
              ),
              // space
              const SizedBox(height: 10),
              // Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
              // space
              const SizedBox(height: 10),
              //Login
              StreamBuilder<bool>(
                stream: _viewModel.outAreAllInputsValid,
                builder: (context, snapshot) {
                  return CustomButton(
                    onPressed: (snapshot.data ?? false)
                        ? () {
                            _viewModel.login();
                          }
                        : null,
                    text: AppStrings.login,
                    backgroundColor: ColorManager.primary,
                  );
                },
              ),
              // space
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppStrings.signUpPrompt),
                  CustomTextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.userTypeRoute);
                    },
                    text: AppStrings.signUp,
                    textColor: ColorManager.primary,
                  )
                ],
              ),
            ],
          ),
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

import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/app_prefs.dart';
import 'package:flutter_advanced_course/app/di.dart';
import 'package:flutter_advanced_course/presentation/common/logout/view_model/logout_view_model.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/routes_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter/scheduler.dart';

class LogoutView extends StatefulWidget {
  const LogoutView({super.key});

  @override
  State<LogoutView> createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
  final AppPrefs _appPrefs = instance<AppPrefs>();

  final LogoutViewModel _viewModel = instance<LogoutViewModel>();

  bind() {
    _viewModel.start();

    _viewModel.isUserLoggedOutSuccessfullyStreamController.stream
        .listen((isLoggedOut) {
      if (isLoggedOut) {
       _appPrefs.logout();
       SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context)
                .pushReplacementNamed(Routes.loginRoute);
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
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppStrings.appBarEditProfileTitle),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(
                context,
                _getContentWidget(),
                () {
                  _viewModel.logout();
                },
              ) ??
              _getContentWidget();
        },
      ),
    );
  }

  Padding _getContentWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
      ),
      child: Column(
        children: [
          const SizedBox(height: AppSize.s8),
          Center(
            child: Text(
              AppStrings.areYouSure,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary,
              ),
            ),
          ),
          const SizedBox(height: 30),
          // new
          StreamBuilder<bool>(
              stream: _viewModel.outputIsAllInputValid,
              builder: (context, snapshot) {
                return CustomButton(
                  onPressed: () {
                    _viewModel.logout();
                  },
                  text: AppStrings.appBarLogoutTitle,
                  backgroundColor: ColorManager.primary,
                );
              }),
        ],
      ),
    );
  }
}

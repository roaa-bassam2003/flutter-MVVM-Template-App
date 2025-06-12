import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/di.dart';
import 'package:flutter_advanced_course/presentation/common/delete_account/view_model/delete_account_view_model.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';

class DeleteAccountView extends StatefulWidget {
  const DeleteAccountView({super.key});

  @override
  State<DeleteAccountView> createState() => _DeleteAccountViewState();
}

class _DeleteAccountViewState extends State<DeleteAccountView> {
  final DeleteAccountViewModel _viewModel = instance<DeleteAccountViewModel>();

  bind() {
    _viewModel.start();
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
      appBar: customAppBar(title: AppStrings.appBarDeleteAccountTitle),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(
                context,
                _getContentWidget(),
                () {
                  _viewModel.deleteAccount();
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
              AppStrings.deleteConfirmationMessage,
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
                    _viewModel.deleteAccount();
                  },
                  text: AppStrings.send,
                  backgroundColor: ColorManager.primary,
                );
              }),
        ],
      ),
    );
  }
}

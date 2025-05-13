import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/di.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/service_provider/report/report_client_view_model.dart';
import 'package:flutter_advanced_course/presentation/service_seeker/report_provider/widgets/custom_static_field.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_text_form_field.dart';

class ReportClient extends StatefulWidget {
  final String userName;

  const ReportClient({super.key, required this.userName});

  @override
  State<ReportClient> createState() => _ReportClientState();
}

class _ReportClientState extends State<ReportClient> {
  final _formKey = GlobalKey<FormState>();
  // final TextEditingController _userNameTextEditingController =
  //     TextEditingController();
  final TextEditingController _reportMessageTextEditingController =
      TextEditingController();
  final ReportClientViewModel _viewModel = instance<ReportClientViewModel>();

  bind() {
    // _viewModel.start();
    _viewModel.setUserName(widget.userName);
    // _userNameTextEditingController.addListener(
    //   () => _viewModel.setUserName(_userNameTextEditingController.text),
    // );
    _reportMessageTextEditingController.addListener(
      () =>
          _viewModel.setReportMessage(_reportMessageTextEditingController.text),
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
      appBar: customAppBar(title: AppStrings.report),
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _viewModel.report();
                }) ??
                _getContentWidget();
          }),
    );
  }

  Widget _getContentWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: AppSize.s16),
            // user name
            CustomStaticField(
              // controller: _userNameTextEditingController,
              label: widget.userName,
            ),
            const SizedBox(height: AppSize.s16),
            // report msg
            StreamBuilder<bool>(
                stream: _viewModel.outputIsReportMessageValid,
                builder: (context, snapshot) {
                  return CustomTextFormField(
                    hintText: AppStrings.problem,
                    textInputType: TextInputType.text,
                    labelText: AppStrings.report,
                    controller: _reportMessageTextEditingController,
                    errorText: (snapshot.data ?? true)
                        ? null
                        : AppStrings.reportMessageError,
                  );
                }),
            const SizedBox(height: AppSize.s16),
            StreamBuilder<bool>(
                stream: _viewModel.outputIsAllInputValid,
                builder: (context, snapshot) {
                  return CustomButton(
                    onPressed: (snapshot.data ?? false)
                        ? () {
                            _viewModel.report();
                          }
                        : null,
                    text: AppStrings.appBarReportTitle,
                    backgroundColor: ColorManager.primary,
                  );
                })
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter_advanced_course/domain/usecase/report_use_case.dart';
import 'package:flutter_advanced_course/presentation/base/base_view_model.dart';
import 'package:flutter_advanced_course/presentation/shared/freezed_data_classes.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';

class ReportClientViewModel extends BaseViewModel
    implements ForgotPasswordViewModelInput, ForgotPasswordViewModelOutput {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _reportMessageStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();

  var reportObj = ReportObject("", "");
  final ReportUseCase _reportUseCase;
  ReportClientViewModel(this._reportUseCase);

  // input
  @override
  void start() {
    inputState.add(ContentState());
  }

  // output
  @override
  void dispose() {
    super.dispose();
    _userNameStreamController.close();
    _reportMessageStreamController.close();
    _isAllInputValidStreamController.close();
  }

  @override
  report() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popUpLoadingState));
    (await _reportUseCase.execute(
            ReportUseCaseInput(reportObj.userName, reportObj.reportMessage)))
        .fold((failure) {
      inputState.add(ErrorState(
        StateRendererType.popUpErrorState,
        failure.message,
      ));
    }, (supportMessage) {
      inputState.add(SuccessState(
        supportMessage,
      ));
    });
  }

  @override
  setUserName(String userName) {
    reportObj = reportObj.copyWith(userName: userName);
    inputIsAllInputValid.add(null);
  }

  @override
  setReportMessage(String reportMessage) {
    inputReportMessage.add(reportMessage);
    reportObj = reportObj.copyWith(reportMessage: reportMessage);
    inputIsAllInputValid.add(null);
  }

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;

  @override
  Sink get inputReportMessage => _reportMessageStreamController.sink;

  @override
  Stream<bool> get outputIsReportMessageValid =>
      _reportMessageStreamController.stream
          .map((supportMessage) => _isSupportMessageValid(supportMessage));

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream
          .map((isAllInputValid) => _isAllInputValid());

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _isSupportMessageValid(String supportMessage) {
    String supportMessageWithOutSpace = supportMessage.replaceAll(' ', '');
    return supportMessageWithOutSpace.isNotEmpty && supportMessageWithOutSpace.length >=10;
  }

  _isAllInputValid() {
    return _isUserNameValid(reportObj.userName) &&
        _isSupportMessageValid(reportObj.reportMessage);
  }
}

abstract class ForgotPasswordViewModelInput {
  report();

  setUserName(String userName);

  setReportMessage(String reportMessage);

  Sink get inputReportMessage;

  Sink get inputIsAllInputValid;
}

abstract class ForgotPasswordViewModelOutput {

  Stream<bool> get outputIsReportMessageValid;

  Stream<bool> get outputIsAllInputValid;
}

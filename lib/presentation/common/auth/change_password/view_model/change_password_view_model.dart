import 'dart:async';
import 'package:flutter_advanced_course/domain/usecase/change_password_use_case.dart';
import 'package:flutter_advanced_course/presentation/base/base_view_model.dart';
import 'package:flutter_advanced_course/presentation/shared/freezed_data_classes.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';

class ChangePasswordViewModel extends BaseViewModel
    implements ForgotPasswordViewModelInput, ForgotPasswordViewModelOutput {
  final StreamController _passwordOneStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordTwoStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();

  var changePasswordObj = ChangePasswordObject("", "");
  final ChangePasswordUseCase _changePasswordUseCase;
  ChangePasswordViewModel(this._changePasswordUseCase);

  // input
  @override
  void start() {
    inputState.add(ContentState());
  }

  // output
  @override
  void dispose() {
    super.dispose();
    _passwordOneStreamController.close();
    _passwordTwoStreamController.close();
    _isAllInputValidStreamController.close();
  }

  @override
  changePassword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popUpLoadingState));
    (await _changePasswordUseCase.execute(ChangePasswordUseCaseInput(
            changePasswordObj.passwordOne, changePasswordObj.passwordTwo)))
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
  setPasswordOne(String passwordOne) {
    inputPasswordOne.add(passwordOne);
    changePasswordObj = changePasswordObj.copyWith(passwordOne: passwordOne);
    inputIsAllInputValid.add(null);
  }

  @override
  setPasswordTwo(String passwordTwo) {
    inputPasswordTwo.add(passwordTwo);
    changePasswordObj = changePasswordObj.copyWith(passwordTwo: passwordTwo);
    inputIsAllInputValid.add(null);
  }

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;

  @override
  Sink get inputPasswordOne => _passwordOneStreamController.sink;

  @override
  Sink get inputPasswordTwo => _passwordTwoStreamController.sink;

  @override
  Stream<bool> get outputIsPasswordOneValid =>
      _passwordOneStreamController.stream
          .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsPasswordTwoValid =>
      _passwordTwoStreamController.stream
          .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream
          .map((isAllInputValid) => _isAllInputValid());

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  _isAllInputValid() {
    return _isPasswordValid(changePasswordObj.passwordOne) &&
        _isPasswordValid(changePasswordObj.passwordTwo);
  }

  // _validate() {
  //   inputIsAllInputValid.add(null);
  // }
}

abstract class ForgotPasswordViewModelInput {
  changePassword();

  setPasswordOne(String passwordOne);

  setPasswordTwo(String passwordTwo);

  Sink get inputPasswordOne;

  Sink get inputPasswordTwo;

  Sink get inputIsAllInputValid;
}

abstract class ForgotPasswordViewModelOutput {
  Stream<bool> get outputIsPasswordOneValid;

  Stream<bool> get outputIsPasswordTwoValid;

  Stream<bool> get outputIsAllInputValid;
}

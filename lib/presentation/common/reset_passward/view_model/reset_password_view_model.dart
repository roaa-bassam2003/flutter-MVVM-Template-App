import 'dart:async';
import 'package:flutter_advanced_course/domain/usecase/reset_password_use_case.dart';
import 'package:flutter_advanced_course/presentation/base/base_view_model.dart';
import 'package:flutter_advanced_course/presentation/shared/freezed_data_classes.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';

class ResetPasswordViewModel extends BaseViewModel
    implements ResetPasswordViewModelInput, ResetPasswordViewModelOutput {
  final StreamController _passwordOneStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordTwoStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();

  final StreamController isUserResetPasswordSuccessfullyStreamController =
      StreamController<void>.broadcast();

  var resetPasswordObj = ResetPasswordObject("", "", "", "");
  final ResetPasswordUseCase _resetPasswordUseCase;
  ResetPasswordViewModel(this._resetPasswordUseCase);

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
    isUserResetPasswordSuccessfullyStreamController.close();
  }

  @override
  changePassword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popUpLoadingState));
    (await _resetPasswordUseCase.execute(ResetPasswordUseCaseInput(
      resetPasswordObj.email,
      resetPasswordObj.token,
      resetPasswordObj.newPassword,
      resetPasswordObj.confirmPassword,
    )))
        .fold((failure) {
      inputState.add(ErrorState(
        StateRendererType.popUpErrorState,
        failure.message,
      ));
    }, (supportMessage) {
      inputState.add(SuccessState(
        supportMessage,
      ));
      isUserResetPasswordSuccessfullyStreamController.add(true);
    });
  }

  @override
  setPasswordOne(String passwordOne) {
    inputPasswordOne.add(passwordOne);
    resetPasswordObj = resetPasswordObj.copyWith(newPassword: passwordOne);
    inputIsAllInputValid.add(null);
  }

  @override
  setPasswordTwo(String passwordTwo) {
    inputPasswordTwo.add(passwordTwo);
    resetPasswordObj = resetPasswordObj.copyWith(confirmPassword: passwordTwo);
    inputIsAllInputValid.add(null);
  }

  @override
  setEmail(String email) {
    resetPasswordObj = resetPasswordObj.copyWith(email: email);
  }

  @override
  setToken(String token) {
    resetPasswordObj = resetPasswordObj.copyWith(token: token);
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
    return _isPasswordValid(resetPasswordObj.newPassword) &&
        _isPasswordValid(resetPasswordObj.confirmPassword) &&
        resetPasswordObj.confirmPassword == resetPasswordObj.newPassword;
  }

  // _validate() {
  //   inputIsAllInputValid.add(null);
  // }
}

abstract class ResetPasswordViewModelInput {
  changePassword();

  setPasswordOne(String passwordOne);

  setPasswordTwo(String passwordTwo);

  setEmail(String email);

  setToken(String token);

  Sink get inputPasswordOne;

  Sink get inputPasswordTwo;

  Sink get inputIsAllInputValid;
}

abstract class ResetPasswordViewModelOutput {
  Stream<bool> get outputIsPasswordOneValid;

  Stream<bool> get outputIsPasswordTwoValid;

  Stream<bool> get outputIsAllInputValid;
}

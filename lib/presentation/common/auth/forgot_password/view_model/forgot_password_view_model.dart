import 'dart:async';

import 'package:flutter_advanced_course/domain/usecase/forgot_password_use_case.dart';
import 'package:flutter_advanced_course/presentation/base/base_view_model.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';

class ForgotPasswordViewModel extends BaseViewModel
    implements ForgotPasswordViewModelInput, ForgotPasswordViewModelOutput {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();

  final StreamController isUserForgetPasswordSuccessfullyStreamController =
      StreamController<bool>();

  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordViewModel(this._forgotPasswordUseCase);

  var email = "";
  String token = "";

  // input
  @override
  void start() {
    inputState.add(ContentState());
  }

  // output
  @override
  void dispose() {
    super.dispose();
    _emailStreamController.close();
    _isAllInputValidStreamController.close();
    isUserForgetPasswordSuccessfullyStreamController.close();
  }

  @override
  forgotPassword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popUpLoadingState));
    (await _forgotPasswordUseCase.execute(email)).fold((failure) {
      inputState.add(ErrorState(
        StateRendererType.popUpErrorState,
        failure.message,
      ));
    }, (data) {
      // inputState.add(SuccessState(
      //   supportMessage,
      // ));

      if (data.isNotEmpty) {
        token = data;
        isUserForgetPasswordSuccessfullyStreamController.add(true);
      } else {
        inputState.add(ErrorState(
          StateRendererType.popUpErrorState,
          "email is not avaliable!",
        ));
      }
    });
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
    _validate();
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream
          .map((isAllInputValid) => _isAllInputValid());

  bool _isEmailValid(String userName) {
    String userNameWithOutSpace = userName.replaceAll(' ', '');
    String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(emailRegex);
    return regExp.hasMatch(userNameWithOutSpace) &&
        userNameWithOutSpace.isNotEmpty;
  }

  _isAllInputValid() {
    return _isEmailValid(email);
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }

  @override
  getToken() {
    return token;
  }

  @override
  getEmail() {
    return email;
  }
}

abstract class ForgotPasswordViewModelInput {
  forgotPassword();

  setEmail(String email);

  getEmail();

  getToken();

  Sink get inputEmail;

  Sink get inputIsAllInputValid;
}

abstract class ForgotPasswordViewModelOutput {
  Stream<bool> get outputIsEmailValid;

  Stream<bool> get outputIsAllInputValid;
}

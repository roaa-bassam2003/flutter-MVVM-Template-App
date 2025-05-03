import 'dart:async';
// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter_advanced_course/domain/usecase/login_use_case.dart';
import 'package:flutter_advanced_course/presentation/base/base_view_model.dart';
import 'package:flutter_advanced_course/presentation/shared/freezed_data_classes.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';

class LoginViewModel extends BaseViewModel
    implements LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  var loginObject = LoginObject("", "");
  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  // inputs
  @override
  void dispose() {
    super.dispose();
    _userNameStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  void start() {
    // view model should tell view please show content state
    inputState.add(ContentState());
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
    // _resetStateToContent(); // Reset state when password changes
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    inputAreAllInputsValid.add(null);
  }

  @override
  login() async {
    inputState.add(LoadingState(
      stateRendererType: StateRendererType.popUpLoadingState,
    ));
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.userName, loginObject.password)))
        .fold((failure) {
      inputState.add(ErrorState(
        StateRendererType.popUpErrorState,
        failure.message,
      ));
    }, (data) {
      inputState.add(ContentState());
      // navigate to main screen
      isUserLoggedInSuccessfullyStreamController.add(true);
    });
  }

  // outputs
  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  // functions
  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    // Regex for email validation
    String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(emailRegex);
    return regExp.hasMatch(userName) && userName.isNotEmpty;
    // return userName.isNotEmpty;
    // return userName.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUserNameValid(loginObject.userName);
  }

  // New method to reset the state to ContentState
  // void _resetStateToContent() {
  //   inputState.add(ContentState());
  // }

  // Method to call when toggling password visibility
  // void onPasswordVisibilityToggled() {
  //   _resetStateToContent();
  // }
}

abstract class LoginViewModelInputs {
  // 3 orders (3 functions) : from view to view model
  // لما المستخدم يكتب اسم المستخدم، الفيو هتبعته هنا
  setUserName(String userName);
  // لما المستخدم يكتب كلمة المرور، الفيو هتبعته هنا
  setPassword(String password);
  // لما المستخدم يضغط على زر "تسجيل الدخول"، الدالة دي هتتنفذ
  login();

  // 2 streams (Sink) : from view to view model (to send inputs to view model in order to validate them)
  // قناة بتبعت اسم المستخدم للـمودل  كل ما المستخدم يكتب حرف
  Sink get inputUserName;
  // قناة بتبعت كلمة المرور للـمودل  كل ما المستخدم يكتب حرف
  Sink get inputPassword;
  Sink get inputAreAllInputsValid;
}

abstract class LoginViewModelOutputs {
  // 2 streams (Stream) : from view model to view (to validate the inputs and tell the view about the result of validation)
  // تبعت قيمة (صح أو غلط) عشان تقول للشاشة إذا كان اسم المستخدم صالح (مثلًا مش فاضي أو طوله مناسب)
  Stream<bool> get outIsUserNameValid;
  // نفس الفكرة لكلمة المرور (مثلًا لازم تكون أكتر من 6 أحرف)
  Stream<bool> get outIsPasswordValid;
  Stream<bool> get outAreAllInputsValid;
}

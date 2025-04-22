import 'dart:async';

// import 'package:flutter_advanced_course/domain/usecase/login_use_case.dart';
import 'package:flutter_advanced_course/presentation/base/base_view_model.dart';
import 'package:flutter_advanced_course/presentation/shared/freezed_data_classes.dart';

class LoginViewModel
    implements BaseViewModel, LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  var loginObject = LoginObject("", "");
  // final LoginUseCase _loginUseCase;
  // LoginViewModel(this._loginUseCase);
  LoginViewModel();

  // inputs
  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValidStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
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
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    inputAreAllInputsValid.add(null);
  }

  @override
  login() async {
    // (await _loginUseCase.execute(
    //         LoginUseCaseInput(loginObject.userName, loginObject.password)))
    //     .fold(
    //         (failure) => {
    //               // left -> failure
    //             },
    //         (data) => {
    //               // right -> data (success)
    //             });
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
    return userName.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUserNameValid(loginObject.userName);
  }
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

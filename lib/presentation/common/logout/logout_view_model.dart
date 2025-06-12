import 'dart:async';
import 'package:flutter_advanced_course/domain/usecase/logout_use_case.dart';
import 'package:flutter_advanced_course/presentation/base/base_view_model.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';

class LogoutViewModel extends BaseViewModel
    implements LogoutViewModelInput, LogoutViewModelOutput {
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();

  final LogoutUseCase _logoutUseCase;

  LogoutViewModel(this._logoutUseCase);
  final StreamController isUserLoggedOutSuccessfullyStreamController =
      StreamController<bool>();

  // input
  @override
  void start() {
    inputState.add(ContentState());
  }

  // output
  @override
  void dispose() {
    super.dispose();
    _isAllInputValidStreamController.close();
  }

  @override
  logout() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popUpLoadingState));
    (await _logoutUseCase.execute(null)).fold((failure) {
      inputState.add(ErrorState(
        StateRendererType.popUpErrorState,
        failure.message,
      ));
    }, (supportMessage) {
      inputState.add(SuccessState(
        supportMessage,
      ));

      isUserLoggedOutSuccessfullyStreamController.add(true);
    });
  }

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream.map((isAllInputValid) => true);
}

abstract class LogoutViewModelInput {
  logout();
  Sink get inputIsAllInputValid;
}

abstract class LogoutViewModelOutput {
  Stream<bool> get outputIsAllInputValid;
}

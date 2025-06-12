import 'dart:async';

import 'package:flutter_advanced_course/domain/usecase/delete_account_use_case.dart';
import 'package:flutter_advanced_course/presentation/base/base_view_model.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';

class DeleteAccountViewModel extends BaseViewModel
    implements DeleteAccountViewModelInput, DeleteAccountViewModelOutput {
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();

  final DeleteAccountUseCase _deleteAccountUseCase;

  DeleteAccountViewModel(this._deleteAccountUseCase);

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
  deleteAccount() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popUpLoadingState));
    (await _deleteAccountUseCase.execute(null)).fold((failure) {
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
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream.map((isAllInputValid) => true);
}

abstract class DeleteAccountViewModelInput {
  deleteAccount();
  Sink get inputIsAllInputValid;
}

abstract class DeleteAccountViewModelOutput {
  Stream<bool> get outputIsAllInputValid;
}

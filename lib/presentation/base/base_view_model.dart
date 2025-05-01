import 'dart:async';

import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';

abstract class BaseViewModel
    implements BaseViewModelInputs, BaseViewModelOutputs {
  // shared variables and functions that will be used throughout any view model
  final StreamController _inputStreamController =
      StreamController<FlowState>.broadcast();

  @override
  Sink get inputState => _inputStreamController.sink;

  @override
  Stream<FlowState> get outputState => _inputStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

// input -> requests from the view to the view model
abstract class BaseViewModelInputs {
  // view tells view model to start its job
  void start();
  // view tells view model to end its job(close any async calls, or close any stream)
  void dispose();

  Sink get inputState;
}

// output -> events from the view model(data from api or repository) to the view
abstract class BaseViewModelOutputs {
  // will be implemented later

  Stream<FlowState> get outputState;
}

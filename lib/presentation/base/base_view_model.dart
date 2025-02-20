abstract class BaseViewModel implements  BaseViewModelInputs, BaseViewModelOutputs{
  // shared variables and functions that will be used throughout any view model
}

// input -> requests from the view to the view model
abstract class BaseViewModelInputs {
  // view tells view model to start its job
  void start();
  // view tells view model to end its job(close any async calls, or close any stream)
  void dispose();
}

// output -> events from the view model(data from api or repository) to the view
abstract class BaseViewModelOutputs {
  // will be implemented later
}

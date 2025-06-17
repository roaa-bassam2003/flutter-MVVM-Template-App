import 'dart:async';
import 'package:flutter_advanced_course/domain/usecase/complete_Bookings_use_case.dart';
import 'package:flutter_advanced_course/presentation/base/base_view_model.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';

class BookingTabViewModel extends BaseViewModel
    implements HomeViewModelInput, HomeViewModelOutput {
  StreamController<HomeViewObject>? _dataStreamController;

  final CompleteBookingsUseCase _completeBookingsUseCase;

  BookingTabViewModel(this._completeBookingsUseCase);

  // -- inputs
  @override
  void start() {
    _dataStreamController = StreamController<HomeViewObject>.broadcast();
    _getHomeData();
  }

  _getHomeData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _completeBookingsUseCase.execute(null)).fold(
        (failure) => {
              // left -> failure
              inputState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message))
            }, (homeObject) {
      // right -> data (success)
      inputState.add(ContentState());
      if (homeObject.data != null && homeObject.data!.isNotEmpty) {
        final firstItem = homeObject.data!.first;
        if (_dataStreamController != null && !_dataStreamController!.isClosed) {
          inputHomeData.add(HomeViewObject(
            firstItem.day,
            firstItem.hours,
            firstItem.totalPrice,
            firstItem.location,
            firstItem.serviceProviderName,
            firstItem.serviceType,
          ));
        }
      } else {
        inputState.add(EmptyState("No bookings found"));
      }
    });
  }

  @override
  void dispose() {
    _dataStreamController?.close();
    _dataStreamController = null;
    super.dispose();
  }

  @override
  Sink get inputHomeData => _dataStreamController!.sink;

  // -- outputs
  @override
  Stream<HomeViewObject> get outputHomeData =>
      _dataStreamController!.stream.map((data) => data);
}

abstract class HomeViewModelInput {
  Sink get inputHomeData;
}

abstract class HomeViewModelOutput {
  Stream<HomeViewObject> get outputHomeData;
}

class HomeViewObject {
  String day;
  String hours;
  int totalPrice;
  String location;
  String serviceProviderName;
  int serviceType;

  HomeViewObject(
    this.day,
    this.hours,
    this.totalPrice,
    this.location,
    this.serviceProviderName,
    this.serviceType,
  );
}

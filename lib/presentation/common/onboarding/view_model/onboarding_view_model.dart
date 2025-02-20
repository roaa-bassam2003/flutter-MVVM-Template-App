// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter_advanced_course/domain/common_models.dart';
import 'package:flutter_advanced_course/presentation/base/base_view_model.dart';
import 'package:flutter_advanced_course/presentation/resources/common/assets_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/common/strings_manager.dart';

class OnboardingViewModel
    implements
        BaseViewModel,
        OnboardingViewModelInputs,
        OnboardingViewModelOutputs {
  // stream controllers outputs
  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  // Onboarding ViewModel Inputs --> from v to vm
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // vm start your job
    _list = _getSliderData();
    // update v
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    // update current index
    _currentIndex = index;
    // send the data based on current index to v
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // Onboarding ViewModel Outputs --> from vm to v
  // event is sliderviewobject that will go to v
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // onboarding private functions
  void _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(
      _list[_currentIndex],
      _list.length,
      _currentIndex,
    ));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(
          AppStrings.onBoardingTitle1,
          AppStrings.onBoardingSubTitle1,
          ImageAssets.onBoardingLogo1,
        ),
        SliderObject(
          AppStrings.onBoardingTitle2,
          AppStrings.onBoardingSubTitle2,
          ImageAssets.onBoardingLogo2,
        ),
        SliderObject(
          AppStrings.onBoardingTitle3,
          AppStrings.onBoardingSubTitle3,
          ImageAssets.onBoardingLogo3,
        ),
        SliderObject(
          AppStrings.onBoardingTitle4,
          AppStrings.onBoardingSubTitle4,
          ImageAssets.onBoardingLogo4,
        ),
      ];
}

// inputs mean that (orders) that our view model will receive from view
abstract class OnboardingViewModelInputs {
  int goNext(); // right arrow
  int goPrevious(); // left arrow
  void onPageChanged(
      int index); // to update screen content based on current index

  // stream controller input --> sink
  Sink get inputSliderViewObject;
}

// outputs mean that (data or changes) that our view model will send to view
abstract class OnboardingViewModelOutputs {
  // stream controller output --> stream
  Stream<SliderViewObject> get outputSliderViewObject;
}

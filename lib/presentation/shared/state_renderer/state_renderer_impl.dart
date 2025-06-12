import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/constants.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}

// loading State (pop up, full screen)
class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String? message;

  LoadingState({
    required this.stateRendererType,
    String message = AppStrings.loading,
  });

  @override
  String getMessage() => message ?? AppStrings.loading;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// Error State (pop up, full screen)
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(
    this.stateRendererType,
    this.message,
  );

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// Content State
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}

// Empty State (full screen)
class EmptyState extends FlowState {
  String message;
  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenEmptyState;
}

// success state
class SuccessState extends FlowState {
  String message;

  SuccessState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.popUpSuccess;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
    BuildContext context,
    Widget contentScreenWidget,
    Function retryActionFunction,
  ) {
    switch (runtimeType) {
      case LoadingState _:
        if (getStateRendererType() == StateRendererType.popUpLoadingState) {
          // إظهار Pop-up للتحميل
          _showPopUp(context, getStateRendererType(), getMessage());
          return contentScreenWidget;
        } else {
          return StateRenderer(
            message: getMessage(),
            stateRendererType: getStateRendererType(),
            retryActionFunction: retryActionFunction,
          );
        }
      case ErrorState _:
        // Dismiss any existing popup safely
        _dismissDialog(context);
        if (getStateRendererType() == StateRendererType.popUpErrorState) {
          // Show error popup
          _showPopUp(context, getStateRendererType(), getMessage());
          return contentScreenWidget;
        } else {
          return StateRenderer(
            message: getMessage(),
            stateRendererType: getStateRendererType(),
            retryActionFunction: retryActionFunction,
          );
        }
      case SuccessState _:
        {
          // i should check if we are showing loading popup to remove it before showing success popup
          _dismissDialog(context);

          // show popup
          _showPopUp(context, StateRendererType.popUpSuccess, getMessage(),
              title: AppStrings.success);
          // return content ui of the screen
          return contentScreenWidget;
        }
      case ContentState _:
        _dismissDialog(context); // Dismiss any existing popup
        return contentScreenWidget;
      case EmptyState _:
        _dismissDialog(context);
        return StateRenderer(
          message: getMessage(),
          stateRendererType: getStateRendererType(),
          retryActionFunction: () {},
        );
      default:
        Navigator.of(context).popUntil((route) => route.isFirst);
        return contentScreenWidget;
    }
  }

  void _showPopUp(
      BuildContext context, StateRendererType stateRendererType, String message,
      {String title = Constants.empty}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible:
            false, // منع إغلاق الـ Pop-up بالضغط خارج الـ Dialog
        builder: (BuildContext context) => StateRenderer(
          stateRendererType: stateRendererType,
          message: message,
          title: title,
          retryActionFunction: () {},
        ),
      );
    });
  }

  void _dismissDialog(BuildContext context) {
    // Dismiss the topmost dialog if present
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}

import 'dart:async';

import 'package:flutter_advanced_course/app/app_prefs.dart';
import 'package:flutter_advanced_course/presentation/base/base_view_model.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer.dart';
import 'package:flutter_advanced_course/presentation/shared/state_renderer/state_renderer_impl.dart';

class ButtonCooldownViewModel extends BaseViewModel
    implements ButtonCooldownViewModelInputs, ButtonCooldownViewModelOutputs {
  final AppPrefs _appPrefs;

  final StreamController<bool> _canPressButtonStreamController =
      StreamController<bool>.broadcast();

  ButtonCooldownViewModel(this._appPrefs);

  @override
  void start() async {
    checkIfCanPressButton();
  }

  @override
  void dispose() {
    _canPressButtonStreamController.close();
    super.dispose();
  }

  // لما المستخدم يدوس على الزرار
  @override
  Future<void> onButtonPressed() async {
    final canPress = await _appPrefs.canPressButtonAgain();

    if (canPress) {
      inputState.add(
        SuccessState("تم إرسال الطلب بنجاح!"), // عرض الرسالة في البوب
      );

      // حفظ وقت الضغط
      await _appPrefs.setLastButtonPressTime();

      // تحديث الستيت عشان نخفي الزرار
      _canPressButtonStreamController.add(false);
    } else {
      inputState.add(
        ErrorState(
          StateRendererType.popUpErrorState,
          "لا يمكنك الضغط على الزرار إلا بعد مرور 48 ساعة.",
        ),
      );
    }
  }

  @override
  Sink<bool> get inputCanPressButton => _canPressButtonStreamController.sink;

  @override
  Stream<bool> get outputCanPressButton =>
      _canPressButtonStreamController.stream;

  @override
  Future<void> checkIfCanPressButton() async {
    final canPress = await _appPrefs.canPressButtonAgain();
    inputCanPressButton.add(canPress);
  }
}

abstract class ButtonCooldownViewModelInputs {
  Future<void> onButtonPressed();

  Future<void> checkIfCanPressButton();

  Sink<bool> get inputCanPressButton;
}

abstract class ButtonCooldownViewModelOutputs {
  Stream<bool> get outputCanPressButton;
}

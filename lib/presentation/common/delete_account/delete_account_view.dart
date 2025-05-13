import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/app/app_prefs.dart';
import 'package:flutter_advanced_course/presentation/resources/color_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_advanced_course/presentation/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteAccountView extends StatefulWidget {
  const DeleteAccountView({super.key});

  @override
  State<DeleteAccountView> createState() => _DeleteAccountViewState();
}

class _DeleteAccountViewState extends State<DeleteAccountView> {
  late AppPrefs _appPrefs;
  bool _isButtonDisabled = false;
  bool _isLoading = true;

  Future<void> _initializeAppPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _appPrefs = AppPrefs(prefs);
    _checkButtonAvailability();
  }

  void _checkButtonAvailability() async {
    bool canPress = await _appPrefs.canPressButtonAgain();
    setState(() {
      _isButtonDisabled = !canPress;
      _isLoading = false;
    });
  }

  // عند الضغط على الزر
  void _onDeleteButtonPressed() async {
    await _appPrefs.setLastButtonPressTime();
    _checkButtonAvailability();
  }

  @override
  void initState() {
    super.initState();
    _initializeAppPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: customAppBar(title: AppStrings.appBarDeleteAccountTitle),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p20,
              ),
              child: Column(
                children: [
                  const SizedBox(height: AppSize.s8),
                  Center(
                    child: Text(
                      AppStrings.deleteConfirmationMessage,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: AppStrings.appBarDeleteAccountTitle,
                    onPressed:
                        _isButtonDisabled ? null : _onDeleteButtonPressed,
                    backgroundColor: ColorManager.primary,
                  ),
                ],
              ),
            ),
    );
  }
}

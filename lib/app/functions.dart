import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';

bool isUserNameValid(String userName) {
  String trimmedUserName = userName.replaceAll(' ', '');
  return trimmedUserName.length >= 4;
}

bool emailValid(String email) {
  String newMail = email.replaceAll(' ', '');
  String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regExp = RegExp(emailRegex);
  return regExp.hasMatch(newMail) && newMail.isNotEmpty && newMail.length >= 6;
}

bool isPhoneNumberValid(String phoneNumber) {
  final regex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
  return phoneNumber.isNotEmpty && regex.hasMatch(phoneNumber);
}

bool isHourPriceValid(double hourPrice) {
  return hourPrice >= 30.00 && hourPrice <= 500.00;
}

String? validatePassword(String password) {
  if (!RegExp(r'[A-Z]').hasMatch(password)) {
    return AppStrings.passwordUpperCaseValid;
  }
  if (!RegExp(r'[a-z]').hasMatch(password)) {
    return AppStrings.passwordLowerCaseValid;
  }
  if (!RegExp(r'[0-9]').hasMatch(password)) {
    return AppStrings.passwordNumberValid;
  }
  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return AppStrings.passwordSpecialCharValid;
  }
  return null; // Password is valid
}

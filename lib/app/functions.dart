import 'package:flutter_advanced_course/presentation/resources/strings_manager.dart';

bool isUserNameValid(String userName) {
  String trimmedUserName = userName.replaceAll(' ', '');
  return trimmedUserName.length >= 4;
}

bool emailValid(String email) {
  // String newMail = email.replaceAll(' ', '');
  String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regExp = RegExp(emailRegex);
  return regExp.hasMatch(email) && email.isNotEmpty && email.length >= 6;
}

bool isPhoneNumberValid(String phoneNumber) {
  String phoneNumberWithOutSpace = phoneNumber.replaceAll(' ', '');
  final regex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
  return phoneNumberWithOutSpace.isNotEmpty &&
      regex.hasMatch(phoneNumberWithOutSpace);
}

bool isHourPriceValid(double hourPrice) {
  return hourPrice >= 30.00 && hourPrice <= 500.00;
}

String? validatePassword(String password) {
  String passwordWithOutSpace = password.replaceAll(' ', '');
  if (!RegExp(r'[A-Z]').hasMatch(passwordWithOutSpace)) {
    return AppStrings.passwordUpperCaseValid;
  }
  if (!RegExp(r'[a-z]').hasMatch(passwordWithOutSpace)) {
    return AppStrings.passwordLowerCaseValid;
  }
  if (!RegExp(r'[0-9]').hasMatch(passwordWithOutSpace)) {
    return AppStrings.passwordNumberValid;
  }
  if (!passwordWithOutSpace.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return AppStrings.passwordSpecialCharValid;
  }
  if (passwordWithOutSpace.length < 6) {
    return AppStrings.passwordLenghtValid;
  }
  return null; // Password is valid
}

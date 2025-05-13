// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';

// login
@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String userName, String password) = _LoginObject;
}

// change password
@freezed
class ChangePasswordObject with _$ChangePasswordObject {
  factory ChangePasswordObject(String passwordOne, String passwordTwo) = _ChangePasswordObject;
}

// report
@freezed
class ReportObject with _$ReportObject {
  factory ReportObject(String userName, String reportMessage) = _ReportObject;
}
// this is the request that will goes to api to get data and then store it in Response class as JSON
import 'package:flutter_advanced_course/data/network/app_api.dart';
import 'package:flutter_advanced_course/data/network/requests.dart';
import 'package:flutter_advanced_course/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<ForgotPasswordResponse> forgotPassword(String email);
  Future<ChangePasswordResponse> changePassword(
      ChangePasswordRequest changePasswordRequest);
  Future<ReportResponse> report(ReportRequest reportRequest);
  Future<GovernmentCityBaseResponse> governmentsCities();
}

// --------------Common----------------
// login Request
class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    return await _appServiceClient.forgotPassword(email);
  }

  @override
  Future<ChangePasswordResponse> changePassword(
      ChangePasswordRequest changePasswordRequest) async {
    return await _appServiceClient.changePassword(
        changePasswordRequest.passwordOne, changePasswordRequest.passwordTwo);
  }

  @override
  Future<ReportResponse> report(ReportRequest reportRequest) async {
    return await _appServiceClient.report(
        reportRequest.userName, reportRequest.reportMessage);
  }

  @override
  Future<GovernmentCityBaseResponse> governmentsCities() async {
    return await _appServiceClient.governmentsCities();
  }
}
// ------------------Client----------------------
// ------------------Service Provider------------
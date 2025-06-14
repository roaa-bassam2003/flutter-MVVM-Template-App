// this is the request that will goes to api to get data and then store it in Response class as JSON
import 'package:flutter_advanced_course/data/network/app_api.dart';
import 'package:flutter_advanced_course/data/network/requests.dart';
import 'package:flutter_advanced_course/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<ForgotPasswordResponse> forgotPassword(String email);
  Future<DeleteAccountResponse> deleteAccount();
  Future<LogoutResponse> logout();
  Future<ChangePasswordResponse> changePassword(
      ChangePasswordRequest changePasswordRequest);
  Future<ResetPasswordResponse> resetPassword(
      ResetPasswordRequest resetPasswordRequest);
  Future<ReportResponse> report(ReportRequest reportRequest);
  Future<CityResponse> cities(int id);
  Future<GovernmentResponse> government();
  Future<AuthenticationServiceProviderResponse> registerServiceProvider(
      ServiceProviderRegisterRequest serviceProviderRegisterRequest);
  Future<AuthenticationClientResponse> registerClient(
      ClientRegisterRequest clientRegisterRequest);
}

// --------------Common----------------
// login Request
class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    return await _appServiceClient.forgotPassword(email);
  }

  @override
  Future<ChangePasswordResponse> changePassword(
      ChangePasswordRequest changePasswordRequest) async {
    return await _appServiceClient.changePassword(
      changePasswordRequest.passwordOne,
      changePasswordRequest.passwordTwo,
    );
  }

  @override
  Future<ReportResponse> report(ReportRequest reportRequest) async {
    return await _appServiceClient.report(
      reportRequest.userName,
      reportRequest.reportMessage,
    );
  }

  @override
  Future<AuthenticationServiceProviderResponse> registerServiceProvider(
      ServiceProviderRegisterRequest serviceProviderRegisterRequest) async {
    final formData = await serviceProviderRegisterRequest.toFormData();
    return await _appServiceClient.registerServiceProvider(formData);
  }

  @override
  Future<CityResponse> cities(int id) async {
    return await _appServiceClient.city(id);
  }

  @override
  Future<GovernmentResponse> government() async {
    return await _appServiceClient.government();
  }

  @override
  Future<DeleteAccountResponse> deleteAccount() async {
    return await _appServiceClient.deleteAccount();
  }

  @override
  Future<LogoutResponse> logout() async {
    return await _appServiceClient.logout();
  }

  @override
  Future<AuthenticationClientResponse> registerClient(
      ClientRegisterRequest clientRegisterRequest) async {
    final formData = await clientRegisterRequest.toFormData();
    return await _appServiceClient.registerClient(formData);
  }

  @override
  Future<ResetPasswordResponse> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    return await _appServiceClient.resetPassword(
      resetPasswordRequest.email,
      resetPasswordRequest.token,
      resetPasswordRequest.newPassword,
      resetPasswordRequest.confirmPassword,
    );
  }
}
// ------------------Client----------------------
// ------------------Service Provider------------

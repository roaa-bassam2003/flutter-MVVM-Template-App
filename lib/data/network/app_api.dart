import 'package:dio/dio.dart';
import 'package:flutter_advanced_course/app/constants.dart';
import 'package:flutter_advanced_course/data/response/responses.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  // http methods as interface for login
  @POST("/api/Account/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  // http methods as interface for register service provider
  @POST("/api/Account/register/ServiceProvider")
  Future<AuthenticationServiceProviderResponse> registerServiceProvider(
    @Body() FormData formData,
  );

  // http methods as interface for forget password
  @POST("/api/Account/forgot-password")
  Future<ForgotPasswordResponse> forgotPassword(
    @Field("email") String email,
  );

  // http methods as interface for change password
  @POST("/api/Account/change-password")
  Future<ChangePasswordResponse> changePassword(
    @Field("oldPassword") String passwordOne,
    @Field("newPassword") String passwordTwo,
  );

  // http methods as interface for delete account
  @POST("/api/User/request-account-deletion")
  Future<DeleteAccountResponse> deleteAccount();

  // http methods as interface for report
  @POST("/api/User/report-user")
  Future<ReportResponse> report(
    @Field("userName") String username,
    @Field("comment") String reportMessage,
  );

  // http methods as interface for governments
  @GET("/api/Account/governments")
  Future<GovernmentResponse> government();

  // http methods as interface for governments-cities
  @FormUrlEncoded()
  @GET("/api/Account/cities/{id}")
  Future<CityResponse> city(
    @Path("id") int id,
  );
}

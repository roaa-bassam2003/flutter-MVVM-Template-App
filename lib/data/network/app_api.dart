import 'package:dio/dio.dart';
import 'package:flutter_advanced_course/app/constants.dart';
import 'package:flutter_advanced_course/data/response/responses.dart';
import 'package:retrofit/http.dart';
import 'parse_error_logger.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  // http methods as interface for login
  @POST("/user/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  // http methods as interface for forget password
  @POST("/Account/forget-password")
  Future<ForgotPasswordResponse> forgotPassword(
    @Field("email") String email,
  );

  // http methods as interface for change password
  @POST("/Account/change-password")
  Future<ChangePasswordResponse> changePassword(
    @Field("passwordOne") String passwordOne,
    @Field("passwordTwo") String passwordTwo,
  );

  // http methods as interface for report
  @POST("/Account/report")
  Future<ReportResponse> report(
    @Field("username") String username,
    @Field("report_message") String reportMessage,
  );
}

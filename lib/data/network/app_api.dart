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
}

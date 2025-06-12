// this is abstract repository or Interface
// its implementation in data layer
// --------------Common----------------
// login Request
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/data/network/requests.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, AuthenticationServiceProvider>> registerServiceProvider(ServiceProviderRegisterRequest serviceProviderRegisterRequest);
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, String>> deleteAccount();
  Future<Either<Failure, String>> logout();
  Future<Either<Failure, String>> changePassword(
      ChangePasswordRequest changePasswordRequest);
  Future<Either<Failure, String>> report(ReportRequest reportRequest);
  Future<Either<Failure, Governments>> government();
  Future<Either<Failure, Cities>> cities(int id);
}
// ------------------Client----------------------
// ------------------Service Provider------------
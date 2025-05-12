// this is abstract repository or Interface
// its implementation in data layer
// --------------Common----------------
// login Request
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/data/network/requests.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future <Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future <Either<Failure, String>> forgotPassword(String email);
  Future <Either<Failure, String>> changePassword(ChangePasswordRequest changePasswordRequest);
}
// ------------------Client----------------------
// ------------------Service Provider------------
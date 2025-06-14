import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/data/network/requests.dart';
import 'package:flutter_advanced_course/domain/repository/repository.dart';
import 'package:flutter_advanced_course/domain/usecase/base_use_case.dart';

class ResetPasswordUseCase
    implements BaseUseCase<ResetPasswordUseCaseInput, String> {
  final Repository _repository;
  ResetPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(
      ResetPasswordUseCaseInput input) async {
    return await _repository.resetPassword(ResetPasswordRequest(
      input.email,
      input.token,
      input.newPassword,
      input.confirmPassword,
    ));
  }
}

class ResetPasswordUseCaseInput {
  String email;
  String token;
  String newPassword;
  String confirmPassword;

  ResetPasswordUseCaseInput(
    this.email,
    this.token,
    this.newPassword,
    this.confirmPassword,
  );
}

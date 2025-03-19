import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/data/network/requests.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/domain/repository/repository.dart';
import 'package:flutter_advanced_course/domain/usecase/base_use_case.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(
      input.email,
      input.password,
    ));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}

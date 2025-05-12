// import 'package:dartz/dartz.dart';
// import 'package:flutter_advanced_course/data/network/failure.dart';
// import 'package:flutter_advanced_course/domain/repository/repository.dart';
// import 'package:flutter_advanced_course/domain/usecase/base_use_case.dart';

// class ChangePasswordUseCase implements BaseUseCase<String, String> {
//   final Repository _repository;
//   ChangePasswordUseCase(this._repository);

//   @override
//   Future<Either<Failure, String>> execute(String input) async {
//     return await _repository.changePassword(input);
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/data/network/requests.dart';
import 'package:flutter_advanced_course/domain/repository/repository.dart';
import 'package:flutter_advanced_course/domain/usecase/base_use_case.dart';

class ChangePasswordUseCase
    implements BaseUseCase<ChangePasswordUseCaseInput, String> {
  final Repository _repository;
  ChangePasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(
      ChangePasswordUseCaseInput input) async {
    return await _repository.changePassword(ChangePasswordRequest(
      input.passwordOne,
      input.passwordTwo,
    ));
  }
}

class ChangePasswordUseCaseInput {
  String passwordOne;
  String passwordTwo;

  ChangePasswordUseCaseInput(this.passwordOne, this.passwordTwo);
}

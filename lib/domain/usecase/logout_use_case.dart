import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/domain/repository/repository.dart';
import 'package:flutter_advanced_course/domain/usecase/base_use_case.dart';

class LogoutUseCase implements BaseUseCase<void, String> {
  final Repository _repository;
  LogoutUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(void input) async {
    return await _repository.logout();
  }
}

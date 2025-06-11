import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/domain/repository/repository.dart';
import 'package:flutter_advanced_course/domain/usecase/base_use_case.dart';

class GovernmentUseCase implements BaseUseCase<void, Governments> {
  final Repository _repository;
  GovernmentUseCase(this._repository);

  @override
  Future<Either<Failure, Governments>> execute(void input) async {
    return await _repository.government();
  }
}

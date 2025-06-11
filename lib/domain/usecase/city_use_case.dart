import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/domain/repository/repository.dart';
import 'package:flutter_advanced_course/domain/usecase/base_use_case.dart';

class CityUseCase implements BaseUseCase<int, Cities> {
  final Repository _repository;
  CityUseCase(this._repository);

  @override
  Future<Either<Failure, Cities>> execute(int input) async {
    return await _repository.cities(input);
  }
}

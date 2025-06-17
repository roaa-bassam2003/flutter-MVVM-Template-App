import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/domain/repository/repository.dart';
import 'package:flutter_advanced_course/domain/usecase/base_use_case.dart';

class CancelBookingsUseCase implements BaseUseCase<void, Booking> {
  final Repository _repository;
  CancelBookingsUseCase(this._repository);

  @override
  Future<Either<Failure, Booking>> execute(void input) async {
    return await _repository.cancelBookings();
  }
}

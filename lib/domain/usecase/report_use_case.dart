import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/data/network/requests.dart';
import 'package:flutter_advanced_course/domain/repository/repository.dart';
import 'package:flutter_advanced_course/domain/usecase/base_use_case.dart';

class ReportUseCase implements BaseUseCase<ReportUseCaseInput, String> {
  final Repository _repository;
  ReportUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(ReportUseCaseInput input) async {
    return await _repository.report(ReportRequest(
      input.userName,
      input.reportMessage,
    ));
  }
}

class ReportUseCaseInput {
  String userName;
  String reportMessage;

  ReportUseCaseInput(this.userName, this.reportMessage);
}

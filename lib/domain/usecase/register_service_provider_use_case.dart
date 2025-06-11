import 'package:dartz/dartz.dart';
import 'package:flutter_advanced_course/data/network/failure.dart';
import 'package:flutter_advanced_course/data/network/requests.dart';
import 'package:flutter_advanced_course/domain/model/models.dart';
import 'package:flutter_advanced_course/domain/repository/repository.dart';
import 'package:flutter_advanced_course/domain/usecase/base_use_case.dart';
import 'dart:io';

class RegisterServiceProviderUseCase
    implements
        BaseUseCase<RegisterServiceProviderUseCaseInput,
            AuthenticationServiceProvider> {
  final Repository _repository;
  RegisterServiceProviderUseCase(this._repository);

  @override
  Future<Either<Failure, AuthenticationServiceProvider>> execute(
      RegisterServiceProviderUseCaseInput input) async {
    return await _repository.registerServiceProvider(
      ServiceProviderRegisterRequest(
        type: input.type,
        certification: input.certification,
        hourPrice: input.hourPrice,
        userNameId: input.userNameId,
        phoneNumber: input.phoneNumber,
        email: input.email,
        password: input.password,
        idCardBackPhoto: input.idCardBackPhoto,
        idCardFrontPhoto: input.idCardFrontPhoto,
        personalPhoto: input.personalPhoto,
        cityId: input.city,
        personWithCard: input.personWithCard,
      ),
    );
  }
}

class RegisterServiceProviderUseCaseInput {
  int type;
  double hourPrice;
  String userNameId;
  String phoneNumber;
  String email;
  String password;
  int city;
  File personalPhoto;
  File personWithCard;
  File idCardFrontPhoto;
  File idCardBackPhoto;
  File? certification;

  RegisterServiceProviderUseCaseInput({
    required this.type,
    this.certification,
    required this.hourPrice,
    required this.userNameId,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.city,
    required this.personWithCard,
    required this.personalPhoto,
    required this.idCardFrontPhoto,
    required this.idCardBackPhoto,
  });
}
